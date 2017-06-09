#import "PTRKeyframesViewManager.h"
#import "PTRKeyframesView.h"
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>

@implementation PTRKeyframesViewManager

RCT_EXPORT_MODULE();

- (UIView *)view
{
    return [[PTRKeyframesView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(src, NSDictionary);

RCT_EXPORT_METHOD(seek:(nonnull NSNumber *)reactTag position:(CGFloat)position)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView seek:position];
        }
    }];
}

RCT_EXPORT_METHOD(playOnce:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView playOnce];
        }
    }];
}


RCT_EXPORT_METHOD(start:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView start];
        }
    }];
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView pause];
        }
    }];
}

RCT_EXPORT_METHOD(resume:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView resume];
        }
    }];
}


RCT_EXPORT_METHOD(stop:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
        id view = viewRegistry[reactTag];
        if (![view isKindOfClass:[PTRKeyframesView class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting PTRKeyframesView, got: %@", view);
        } else {
            PTRKeyframesView *keyframesView = (PTRKeyframesView *)view;
            [keyframesView stop];
        }
    }];
}

RCT_EXPORT_VIEW_PROPERTY(onStop, RCTDirectEventBlock);

@end
