#import <UIKit/UIKit.h>
#import <React/RCTView.h>
#import <keyframes/KFVector.h>

@interface PTRKeyframesView : RCTView
@property (nonatomic, copy) NSDictionary *src;
- (void)seek:(CGFloat)position;
- (void)setRepeatCount:(CGFloat)count;
- (void)start;
- (void)stop;
@end
