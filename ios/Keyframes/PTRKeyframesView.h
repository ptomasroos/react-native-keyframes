#import <UIKit/UIKit.h>
#import <React/RCTView.h>
#import <keyframes/KFVector.h>

@interface PTRKeyframesView : RCTView
@property (nonatomic, copy) RCTDirectEventBlock onStop;
@property (nonatomic, copy) NSDictionary *src;
- (void)seek:(CGFloat)position;
- (void)playOnce;
- (void)start;
- (void)stop;
- (void)pause;
- (void)resume;
@end
