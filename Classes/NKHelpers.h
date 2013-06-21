//
//  NKHelpers.h
//  Zone
//
//  Created by Vojtech Rinik on 2/6/13.
//
//



CGColorRef NKColorStringToCGColor(NSString *colorHex);

void NKDrawBackground(CGContextRef context, NSRect drawingRect, NSString *colorHex);
void NKDrawGradientWithHexColors(CGContextRef context, NSRect drawingRect, NSString *startingHex, NSString *endingHex);
void NKDrawGradientWithColors(CGContextRef context, NSRect drawingRect, NSColor *startingColor, NSColor *endingColor);
void NKDrawBorder(CGContextRef context, NSRect drawingRect, NKBorderSide side, CGFloat lineWidth, NSString *colorHex);
void NKDrawBorderWithColor(CGContextRef context, NSRect drawingRect, NKBorderSide side, CGFloat lineWidth, NSColor *color);
void NKSetBorderRadius(CGContextRef context, NSRect drawingRect, CGFloat radius);
void NKDrawBorderWithRadius(CGContextRef context, NSRect drawingRect, CGFloat lineWidth, NSString *colorHex, CGFloat radius);
void NKDrawRectWithRadius(CGContextRef context, NSRect drawingRect, NSString *colorHex, CGFloat radius);


CGPathRef NKCreateBorderRadiusPath(NSRect rect, CGFloat radius);
CGGradientRef NKCreateGradientWithHexColors(NSString *startingHex, NSString *endingHex);
CGGradientRef NKCreateGradientWithColors(NSColor *startingColor, NSColor *endingColor);