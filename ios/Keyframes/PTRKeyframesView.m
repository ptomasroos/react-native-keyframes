#import "PTRKeyframesView.h"
#import <React/RCTConvert.h>

#import <keyframes/KFVector.h>
#import <keyframes/KFVectorLayer.h>
#import <keyframes/KFVectorParsingHelper.h>

@implementation PTRKeyframesView {
    KFVectorLayer *_vectorLayer;
    BOOL _hasPendingStart;
    BOOL _hasPendingStop;
    BOOL _hasPendingPlayOnce;
    BOOL _hasPendingSeek;
    BOOL _isPlayOnce;
    CGFloat _pendingSeek;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

#pragma mark - React View Management


- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
    RCTLogError(@"PTRKeyframesView cannot have any subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    RCTLogError(@"PTRKeyframesView cannot have any subviews");
    return;
}

- (void)layoutSubviews
{
    NSLog(@"PTRKeyframesView layoutSubviews");
    
    [super layoutSubviews];
    
    KFVector *vector = KFVectorFromDictionary(_src);
    
    _vectorLayer = [KFVectorLayer new];
    _vectorLayer.frame = self.bounds;
    _vectorLayer.faceModel = vector;
    
    [self.layer addSublayer:_vectorLayer];
    
    [self maybeSeek];
    [self maybePlayOnce];
    [self maybeStart];
    [self maybeStop];
}

- (void)setSrc:(NSString *)src
{
    NSLog(@"PTRKeyframesView setSrc");
    
    if (![src isEqual:_src]) {
        _src = [src copy];
    }
}

- (void)seek:(CGFloat)position
{
    NSLog(@"PTRKeyframesView seek");
    _hasPendingSeek = true;
    _pendingSeek = position;
    [self maybeSeek];
}

- (void)maybeSeek {
    if (_hasPendingSeek && _vectorLayer) {
        CGFloat position = _pendingSeek;
        _hasPendingSeek = false;
        [_vectorLayer pauseAnimation];
        [_vectorLayer seekToProgress:position];
    }
}

- (void)playOnce
{
    NSLog(@"PTRKeyframesView playOnce");
    _hasPendingPlayOnce = true;
    _isPlayOnce = true;
    [self maybePlayOnce];
    
}

- (void)maybePlayOnce {
    if (_hasPendingPlayOnce && _vectorLayer) {
        _hasPendingPlayOnce = false;
        
        [self addStopBlock];
        [_vectorLayer setRepeatCount:1.0];
        [_vectorLayer startAnimation];
    }
}

- (void)addStopBlock {
    __weak PTRKeyframesView *weakSelf = self;
    
    [_vectorLayer setAnimationDidStopBlock:^(BOOL finished) {
        NSLog(@"PTRKeyframesView setAnimationDidStopBlock");
        
        if (finished && weakSelf != nil) {
            PTRKeyframesView *strongSelf = weakSelf;
            NSLog(@"PTRKeyframesView setAnimationDidStopBlock finished");
            strongSelf.onStop(nil);
            if (strongSelf->_isPlayOnce) {
                [strongSelf->_vectorLayer setAnimationDidStopBlock:nil];
            }
        }
    }];
    
}

- (void)clearStopBlock {
    [_vectorLayer setAnimationDidStopBlock:nil];
}

- (void)start
{
    NSLog(@"PTRKeyframesView start");
    _hasPendingStart = true;
    [self maybeStart];
}

- (void)maybeStart {
    if (_hasPendingStart && _vectorLayer) {
        _hasPendingStart = false;
        
        [self addStopBlock];
        [_vectorLayer startAnimation];
    }
}

- (void)stop
{
    NSLog(@"PTRKeyframesView stop");
    _hasPendingStop = true;
    [self maybeStop];
}

- (void)maybeStop {
    if (_hasPendingStop && _vectorLayer) {
        _hasPendingStop = false;
        [_vectorLayer pauseAnimation];
        [self clearStopBlock];
    }
}

- (void)pause
{
    NSLog(@"PTRKeyframesView pause");
    [_vectorLayer pauseAnimation];
}

- (void)resume {
    NSLog(@"PTRKeyframesView resume");
    
    [self addStopBlock];
    [_vectorLayer resumeAnimation];
}

@end
