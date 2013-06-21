//
//  NKView.h
//  Zone
//
//  Created by Vojtech Rinik on 2/6/13.
//
//

#import "NKStyle.h"

@interface NKView : NSView

@property (nonatomic, strong) NKStyle *style;

@property (assign) NSTrackingRectTag nk_trackingTag;

- (void)nk_trackMouseMove;
- (void)nk_trackMouseEnterExit;

#pragma mark - Drawing

- (void)nk_drawBackground:(NSString *)color;
- (void)nk_drawBorder:(NKBorderSide)side lineWidth:(CGFloat)lineWidth color:(NSString *)color;
- (void)nk_drawGradientStartColor:(NSString *)startColor endColor:(NSString *)endColor;

@end
