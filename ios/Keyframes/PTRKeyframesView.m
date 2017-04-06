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
    RCTLogError(@"Keyframes cannot have any subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    RCTLogError(@"Keyframes cannot have any subviews");
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
    
    __weak typeof(self) weakSelf = self;
    
    [_vectorLayer setAnimationDidStopBlock:^(BOOL finished) {
        NSLog(@"setAnimationDidStopBlock");
        if (finished && weakSelf != nil) {
            NSLog(@"setAnimationDidStopBlock finished");
            weakSelf.onStop(nil);
        }
    }];
        
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
    [self maybePlayOnce];
    
}

- (void)maybePlayOnce {
    if (_hasPendingPlayOnce && _vectorLayer) {
        _hasPendingPlayOnce = false;
        [_vectorLayer setRepeatCount:1.0];
        [_vectorLayer startAnimation];
    }
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
    }
}

@end
