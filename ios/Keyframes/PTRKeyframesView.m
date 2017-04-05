#import "PTRKeyframesView.h"
#import <React/RCTConvert.h>

#import <keyframes/KFVector.h>
#import <keyframes/KFVectorLayer.h>
#import <keyframes/KFVectorParsingHelper.h>

@implementation PTRKeyframesView {
    KFVectorLayer *_vectorLayer;
    BOOL _hasPendingStart;
    BOOL _hasPendingStop;
    CGFloat _pendingSeek;
    CGFloat _pendingRepeatCount;
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
    const CGFloat shortSide = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    const CGFloat longSide = MAX(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    _vectorLayer.frame = CGRectMake(shortSide / 4, longSide / 2 - shortSide / 4, shortSide / 2, shortSide / 2);
    _vectorLayer.faceModel = vector;
    
    [self.layer addSublayer:_vectorLayer];
    
    [self maybeSeek];
    [self maybeSetRepeatCount];
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
    _pendingSeek = position;
    [self maybeSeek];
}

- (void)maybeSeek {
    if (_pendingSeek && _vectorLayer) {
        CGFloat position = _pendingSeek;
        _pendingSeek = 0.0;
        [_vectorLayer resetAnimations];
        [_vectorLayer seekToProgress:position];
    }
}

- (void)setRepeatCount:(CGFloat)count
{
    NSLog(@"PTRKeyframesView setRepeatCount");
    _pendingRepeatCount = count;
    [self maybeSetRepeatCount];
    
}

- (void)maybeSetRepeatCount {
    if (_pendingRepeatCount && _vectorLayer) {
        CGFloat count = _pendingRepeatCount;
        _pendingRepeatCount = 0.0;
        [_vectorLayer setRepeatCount:count];
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
