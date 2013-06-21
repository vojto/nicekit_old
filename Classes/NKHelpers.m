//
//  NKHelpers.m
//  Zone
//
//  Created by Vojtech Rinik on 2/6/13.
//
//

#import "NiceKit.h"
#import "NKHelpers.h"

CGColorRef NKColorStringToCGColor(NSString *colorHex) {
    return [NSColor colorWithHex:colorHex].CGColor;
}

void NKDrawBackground(CGContextRef context, NSRect drawingRect, NSString *colorHex) {
    CGColorRef color = NKColorStringToCGColor(colorHex);
    CGContextSetFillColorWithColor(context, color);
    CGContextFillRect(context, drawingRect);
}

void NKDrawGradientWithHexColors(CGContextRef context, CGRect drawingRect, NSString *startingHex, NSString *endingHex) {
    CGGradientRef gradient = NKCreateGradientWithHexColors(startingHex, endingHex);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(NSMidX(drawingRect), NSMinY(drawingRect)),
                                CGPointMake(NSMidX(drawingRect), NSMaxY(drawingRect)), 0);
    CGGradientRelease(gradient);
}

void NKDrawGradientWithColors(CGContextRef context, NSRect drawingRect, NSColor *startingColor, NSColor *endingColor) {
    CGGradientRef gradient = NKCreateGradientWithColors(startingColor, endingColor);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(NSMidX(drawingRect), NSMinY(drawingRect)),
                                CGPointMake(NSMidX(drawingRect), NSMaxY(drawingRect)), 0);
    CGGradientRelease(gradient);
}

void NKDrawBorderWithColor(CGContextRef context, NSRect drawingRect, NKBorderSide side, CGFloat lineWidth, NSColor *borderColor) {
    CGColorRef color = borderColor.CGColor;
    CGContextSetFillColorWithColor(context, color);

    // Bottom rectangle huh
    CGRect lineRect = drawingRect;
    if ([side isEqualToString:kNKBorderBottom]) {
        lineRect.size.height = lineWidth;
    } else if ([side isEqualToString:kNKBorderTop]) {
        lineRect.size.height = lineWidth;
        lineRect.origin.y = drawingRect.size.height - lineWidth;
    } else if ([side isEqualToString:kNKBorderLeft]) {
        lineRect.size.width = lineWidth;
    } else if ([side isEqualToString:kNKBorderRight]) {
        lineRect.size.width = lineWidth;
        lineRect.origin.x = drawingRect.size.width - lineWidth;
    }

    CGContextFillRect(context, lineRect);
}

void NKDrawBorder(CGContextRef context, CGRect drawingRect, NKBorderSide side, CGFloat lineWidth, NSString *colorHex) {
    NKDrawBorderWithColor(context, drawingRect, side, lineWidth, [NSColor colorWithHex:colorHex]);
    
}

CGPathRef NKCreateBorderRadiusPath(NSRect rect, CGFloat radius) {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
    CGPathAddArc(path, NULL, CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect) + radius, radius, 3 * M_PI / 2, 0, 0);
    CGPathAddArc(path, NULL, CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect) - radius, radius, 0, M_PI / 2, 0);
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + radius, CGRectGetMaxY(rect) - radius, radius, M_PI / 2, M_PI, 0);
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect) + radius, radius, M_PI, 3 * M_PI / 2, 0);
    CGPathCloseSubpath(path);
    return path;
}

void NKSetBorderRadius(CGContextRef context, NSRect rect, CGFloat radius) {
    CGPathRef path = NKCreateBorderRadiusPath(rect, radius);
    CGContextAddPath(context, path);
    CGContextClip(context);
}

void NKDrawBorderWithRadius(CGContextRef context, NSRect drawingRect, CGFloat lineWidth, NSString *colorHex, CGFloat radius) {
    drawingRect = CGRectInset(drawingRect, .5, .5);
    CGPathRef path = NKCreateBorderRadiusPath(drawingRect, radius);
    CGColorRef color = NKColorStringToCGColor(colorHex);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, lineWidth);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
}

void NKDrawRectWithRadius(CGContextRef context, NSRect drawingRect, NSString *colorHex, CGFloat radius) {
    NSColor *color = [NSColor colorWithHex:colorHex];
    CGPathRef path = NKCreateBorderRadiusPath(drawingRect, radius);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFill);
}

CGGradientRef NKCreateGradientWithHexColors(NSString *startingHex, NSString *endingHex) {
    NSColor *startingColor = [NSColor colorWithHex:startingHex];
    NSColor *endingColor = [NSColor colorWithHex:endingHex];
    return NKCreateGradientWithColors(startingColor, endingColor);
}

CGGradientRef NKCreateGradientWithColors(NSColor *startingColor, NSColor *endingColor) {
    CGFloat locations[2] = {0.0f, 1.0f, };
	CGColorRef cgStartingColor = [startingColor CGColor]; // TODO: Pre-Lion compatibility
	CGColorRef cgEndingColor = [endingColor CGColor];
    CFArrayRef colors = (__bridge_retained CFArrayRef)[NSArray arrayWithObjects:(__bridge id)cgEndingColor, (__bridge id)cgStartingColor, nil];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colors, locations);
    CGColorSpaceRelease(colorSpace);
	CGColorRelease(cgStartingColor);
	CGColorRelease(cgEndingColor);
    return gradient;
}

