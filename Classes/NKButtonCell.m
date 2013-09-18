//
//  ZNButtonCell.m
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKButtonCell.h"

@implementation NKButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [NSFont fontWithName:@"HelveticaNeue-Bold" size:11];
}

- (BOOL)isOpaque {
    return YES;
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    CGContextRef c = [[NSGraphicsContext currentContext] graphicsPort];

    CGContextSaveGState(c);
    NKSetBorderRadius(c, frame, 3.0);
    CGContextSetFillColorWithColor(c, [NSColor colorWithDeviceWhite:1.0 alpha:0.5].CGColor);
    CGContextFillRect(c, frame);
    frame.size.height -= 1;
    if (!self.isEnabled) {
        NKDrawGradientWithHexColors(c, frame, @"f8f8f8", @"fff");
    } else if ([self isHighlighted]) {
        NKDrawGradientWithHexColors(c, frame, @"fff", @"f8f8f8");
    } else {
        NKDrawGradientWithHexColors(c, frame, @"f8f8f8", @"fff");
    }
    CGContextRestoreGState(c);
    NKDrawBorderWithRadius(c, frame, 1.0, @"cecbce", 3.0);
}

@end
