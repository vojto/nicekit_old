//
//  NKView.h
//  Zone
//
//  Created by Vojtech Rinik on 2/6/13.
//
//

#import "NiceKit.h"
@class NKStyle;

@interface NKView : NSView

@property (nonatomic, strong) NKStyle *style;

@property (assign) NSTrackingRectTag nk_trackingTag;

#pragma mark - Setup

- (void)setupStyle;

#pragma mark - Mouse setup

- (void)nk_trackMouseMove;
- (void)nk_trackMouseEnterExit;

#pragma mark - Drawing

- (void)nk_drawBackground:(NSString *)color;
- (void)nk_drawBorder:(NKBorderSide)side lineWidth:(CGFloat)lineWidth color:(NSString *)color;
- (void)nk_drawGradientStartColor:(NSString *)startColor endColor:(NSString *)endColor;

@end
