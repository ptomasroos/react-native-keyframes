#import "PTRKeyframesViewManager.h"
#import "PTRKeyframesView.h"

@implementation PTRKeyframesViewManager

RCT_EXPORT_MODULE();

- (UIView *)view
{
    return [[PTRKeyframesView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(src, NSDictionary);

@end
