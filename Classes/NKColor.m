//
//  NKColor.m
//  Zone
//
//  Created by Vojtech Rinik on 3/2/13.
//
//

#import "NKColor.h"
#import "NSColor+Hex.h"

@implementation NKColor

+ (NKColor *)colorWithColor:(NSColor *)color {
    return [[NKColor alloc] initWithColor:color];
}

+ (NKColor *)colorWithHex:(NSString *)hex {
    return [NKColor colorWithColor:[NSColor colorWithHex:hex]];
}

+ (NKColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha {
    NSColor *color = [NSColor colorWithHex:hex];
    return [NKColor colorWithColor:[color colorWithAlphaComponent:alpha]];
}

// Named colors

+ (NKColor *)redColor {
    return [NKColor colorWithColor:[NSColor redColor]];
}

// Constructor

- (id)initWithColor:(NSColor *)color {
    if ((self = [super init])) {
        self.color = color;
    }

    return self;
}

- (CGColorRef)CGColor {
    return self.color.CGColor;
}

@end
