//
//  NKTUIView.m
//  Zone
//
//  Created by Vojtech Rinik on 2/20/13.
//
//

#import "NKTUIView.h"

@implementation NKTUIView

- (void)nk_drawBackground:(NSString *)color {
    NKDrawBackground([self nk_context], self.bounds, color);
}

- (void)nk_drawBorder:(NKBorderSide)side lineWidth:(CGFloat)lineWidth color:(NSString *)color {
    NKDrawBorder([self nk_context], self.bounds, side, lineWidth, color);
}

- (void)nk_drawGradientStartColor:(NSString *)startColor endColor:(NSString *)endColor {
    NKDrawGradientWithHexColors([self nk_context], self.bounds, startColor, endColor);
}

#pragma mark - Helpers

- (CGContextRef)nk_context {
//    return [[NSGraphicsContext currentContext] graphicsPort];
    return _context.context;
}

@end
