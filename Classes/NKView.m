//
//  NKView.m
//  Zone
//
//  Created by Vojtech Rinik on 2/6/13.
//
//

#import "NKView.h"

@implementation NKView

- (id)initWithFrame:(NSRect)frameRect {
    if ((self = [super initWithFrame:frameRect])) {
        self.style = [[NKStyle alloc] initWithFrame:self.bounds];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.style draw];
}

- (void)nk_trackMouseMove {
    int opts = NSTrackingActiveAlways | NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved;
    NSTrackingArea *area = [[NSTrackingArea alloc] initWithRect:self.bounds options:opts owner:self userInfo:nil];
    [self addTrackingArea:area];
}

- (void)nk_trackMouseEnterExit {
    int opts = NSTrackingActiveAlways | NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited;
    NSTrackingArea *area = [[NSTrackingArea alloc] initWithRect:self.bounds options:opts owner:self userInfo:nil];
    [self addTrackingArea:area];
}

- (CGContextRef)nk_context {
    return [[NSGraphicsContext currentContext] graphicsPort];
}

- (void)nk_drawBackground:(NSString *)color {
    NKDrawBackground([self nk_context], self.bounds, color);
}

- (void)nk_drawBorder:(NKBorderSide)side lineWidth:(CGFloat)lineWidth color:(NSString *)color {
    NKDrawBorder([self nk_context], self.bounds, side, lineWidth, color);
}

- (void)nk_drawGradientStartColor:(NSString *)startColor endColor:(NSString *)endColor {
    NKDrawGradientWithHexColors([self nk_context], self.bounds, startColor, endColor);
}

@end
