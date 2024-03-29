//
//  NKStyle.m
//  Zone
//
//  Created by Vojtech Rinik on 3/2/13.
//
//

#import <BlocksKit/BlocksKit.h>
#import "NKStyle.h"
#import "NKShadow.h"
#import "NKColorGroup.h"

NSString *const kNKBorderTop = @"top";
NSString *const kNKBorderBottom = @"bottom";
NSString *const kNKBorderLeft = @"left";
NSString *const kNKBorderRight = @"right";
NSString *const kNKBorderAll = @"all";

@interface NKStyle ()

@property (nonatomic, strong) NSMutableDictionary *borderColors;
@property (nonatomic, strong) NSMutableDictionary *borderWidths;
@property (nonatomic, nonatomic, strong) NSMutableDictionary *borderRadiuses;
@property (nonatomic, strong) NSMutableArray *shadows;
@property (readonly) CGPathRef path;

@end

@implementation NKStyle

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super init])) {
        self.frame = frame;
        self.borderRadius = 0;
        self.borderColors = [NSMutableDictionary dictionary];
        self.borderWidths = [NSMutableDictionary dictionary];
        self.borderRadiuses = [NSMutableDictionary dictionary];
        self.shadows = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Setup

- (void)setBorderWidth:(CGFloat)width forSide:(NKBorderSide)side {
    [self.borderWidths setObject:@(width) forKey:side];
}

- (void)setBorderColor:(NKColor *)color forSide:(NKBorderSide)side {
    if (color == nil) {
        [self.borderColors removeObjectForKey:side];
    } else {
        [self.borderColors setObject:color forKey:side];
    }
}

- (NKColor *)borderColorForSide:(NKBorderSide)side {
    return self.borderColors[side];
}

- (void)setBorderRadius:(CGFloat)borderRadius {
    [self setBorderRadius:borderRadius forSide:kNKBorderAll];
}

- (void)setBorderRadius:(CGFloat)borderRadius forSide:(NKBorderSide)side {
    [self.borderRadiuses setObject:@(borderRadius) forKey:side];
}

- (void)addShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color {
    NKShadow *shadow = [[NKShadow alloc] init];
    shadow.offset = offset;
    shadow.blurRadius = blurRadius;
    shadow.color = color;
    [self.shadows addObject:shadow];
}

- (void)addInsetShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color {
    NKShadow *shadow = [[NKShadow alloc] init];
    shadow.offset = offset;
    shadow.blurRadius = blurRadius;
    shadow.color = color;
    shadow.isInset = YES;
    [self.shadows addObject:shadow];
}

#pragma mark - Drawing

- (void)draw {

    [self drawDropShadows];
    [self drawBackground];
    [self drawInsetShadows];

    [self drawBorder];
}

#pragma mark - Background

- (void)drawBackground {
    if (self.backgroundColor) {
        [self drawBackgroundColor];
    } else if (self.backgroundColors) {
        [self drawBackgroundColors];
    }
}

- (void)drawBackgroundColor {
    if (!self.backgroundColor) return;

    [self drawColor:self.backgroundColor];
}

- (void)drawColor:(NKColor *)color {
    CGContextRef ctx = self.context;
    CGPathRef path = self.path;
    CGContextSetFillColorWithColor(ctx, color.color.CGColor);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathFill);
}

- (void)drawBackgroundColors {
    CGContextRef ctx = self.context;
    CGGradientRef gradient = [self gradientWithStartColor:self.backgroundColors[0] endColor:self.backgroundColors[1]];
    CGContextSaveGState(ctx);
    CGContextAddPath(ctx, self.path);
    CGContextClip(ctx);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(NSMidX(self.frame), NSMinY(self.frame)),
                                CGPointMake(NSMidX(self.frame), NSMaxY(self.frame)), 0);
    CGGradientRelease(gradient);
    CGContextRestoreGState(ctx);
}

#pragma mark - Border

- (void)drawBorder {
    for (NSString *borderSide in self.borderColors.allKeys) {
        if ([borderSide isEqualToString:kNKBorderAll]) {
            [self drawBorderAllSides];
        } else {
            [self drawBorderOnSide:borderSide];
        }
    }
}

- (void)drawBorderAllSides {
    CGContextRef ctx = self.context;
    CGPathRef path = self.borderPath;

    NKColor *color = self.borderColors[kNKBorderAll];
    CGFloat width = [self borderWidthFor:kNKBorderAll];

    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetLineWidth(ctx, width);
    CGContextAddPath(ctx, path);
    CGContextDrawPath(ctx, kCGPathStroke);
}


- (void)drawBorderOnSide:(NKBorderSide)side {
    NKColor *color = self.borderColors[side];
    CGContextRef ctx = self.context;
    CGRect drawingRect = self.frame;
    CGFloat lineWidth = [self borderWidthFor:side];
    CGRect lineRect = self.frame;
    if ([side isEqualToString:kNKBorderBottom]) {
        lineRect.origin.y = lineRect.size.height - lineWidth;
        lineRect.size.height = lineWidth;
    } else if ([side isEqualToString:kNKBorderTop]) {
        lineRect.size.height = lineWidth;
        lineRect.origin.y = 0;
    } else if ([side isEqualToString:kNKBorderLeft]) {
        lineRect.size.width = lineWidth;
    } else if ([side isEqualToString:kNKBorderRight]) {
        lineRect.size.width = lineWidth;
        lineRect.origin.x = (drawingRect.origin.x + drawingRect.size.width) - lineWidth;
    }

    CGContextSetFillColorWithColor(ctx, color.color.CGColor);
    CGContextFillRect(ctx, lineRect);
}

- (CGFloat)borderWidthFor:(NKBorderSide)side {
    NSNumber *number = self.borderWidths[side];
    if (number) {
        return number.floatValue;
    } else {
        return 1.0;
    }
}

#pragma mark - Shadows

- (void)drawDropShadows {
    CGContextRef ctx = self.context;
    for (NKShadow *shadow in self.shadows) {
        if (shadow.isInset) continue;

        CGContextSaveGState(ctx);
        CGContextSetShadowWithColor(ctx, shadow.offset, shadow.blurRadius, shadow.color.CGColor);
        [self drawColor:[NKColor colorWithColor:[NSColor whiteColor]]];
        CGContextRestoreGState(ctx);
    }
}

- (void)drawInsetShadows {
    NSArray *shadows = [self.shadows bk_select:^BOOL(NKShadow *shadow) {
        return shadow.isInset;
    }];
    for (NKShadow *shadow in shadows) {
        [self drawInsetShadow:shadow];
    }
}

- (void)drawInsetShadow:(NKShadow *)shadow {
    CGContextRef ctx = self.context;
    CGFloat shadowBlurRadius = shadow.blurRadius;
    CGSize shadowOffset = shadow.offset;
    CGPathRef rectanglePath = self.path;
    CGRect bounds = CGPathGetBoundingBox(rectanglePath);
    CGRect rectangleBorderRect = CGRectInset(bounds, -shadowBlurRadius, -shadowBlurRadius);
    rectangleBorderRect = CGRectOffset(rectangleBorderRect, -shadowOffset.width, -shadowOffset.height);
    rectangleBorderRect = CGRectInset(CGRectUnion(rectangleBorderRect, bounds), -1, -1);

    CGMutablePathRef tempPath = CGPathCreateMutableCopy(CGPathCreateWithRect(rectangleBorderRect, NULL));
    CGPathAddPath(tempPath, NULL, rectanglePath);
    CGPathCloseSubpath(tempPath);
    CGPathRef rectangleNegativePath = CGPathCreateCopy(tempPath);

    CGContextSaveGState(ctx);
    CGFloat xOffset = shadowOffset.width + round(rectangleBorderRect.size.width);
    CGFloat yOffset = shadowOffset.height;
    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset));
    CGContextSetShadowWithColor(ctx, shadowOffset, shadowBlurRadius, shadow.color.CGColor);
    CGContextAddPath(ctx, rectanglePath);
    CGContextClip(ctx);
    CGContextSetFillColorWithColor(ctx, shadow.color.CGColor);
    CGContextAddPath(ctx, rectangleNegativePath);
    CGContextEOFillPath(ctx);
    CGContextRestoreGState(ctx);
}


#pragma mark - Paths

- (CGPathRef)path {
    return [self roundedRectPath:self.frame];
}

- (CGPathRef)borderPath {
    CGRect drawingRect = CGRectInset(self.frame, .5, .5);
    return [self roundedRectPath:drawingRect];
}

- (CGPathRef)roundedRectPath:(CGRect)rect {
//    CGFloat radius1 = [self borderRadiusForSide:kNKBorderLeft];
    CGFloat radius = 0;
    CGFloat radius1 = [self borderRadiusForSide:kNKBorderRight];
    CGFloat radius2 = [self borderRadiusForSide:kNKBorderBottom];
    CGFloat radius3 = [self borderRadiusForSide:kNKBorderLeft];
    CGFloat radius4 = [self borderRadiusForSide:kNKBorderTop];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect) + radius4, CGRectGetMinY(rect));
    CGPathAddArc(path, NULL, CGRectGetMaxX(rect) - radius1, CGRectGetMinY(rect) + radius1, radius1, 3 * M_PI / 2, 0, 0);
    CGPathAddArc(path, NULL, CGRectGetMaxX(rect) - radius2, CGRectGetMaxY(rect) - radius2, radius2, 0, M_PI / 2, 0);
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + radius3, CGRectGetMaxY(rect) - radius3, radius3, M_PI / 2, M_PI, 0);
    CGPathAddArc(path, NULL, CGRectGetMinX(rect) + radius4, CGRectGetMinY(rect) + radius4, radius4, M_PI, 3 * M_PI / 2, 0);
    CGPathCloseSubpath(path);
    return path;
}

- (CGFloat)borderRadiusForSide:(NKBorderSide)side {
    // For side
    if ([self.borderRadiuses objectForKey:side]) {
        return [[self.borderRadiuses objectForKey:side] floatValue];
    } else if ([self.borderRadiuses objectForKey:kNKBorderAll]) {
        return [[self.borderRadiuses objectForKey:kNKBorderAll] floatValue];
    } else {
        return 0.0;
    }
}

- (CGContextRef)context {
    return [NSGraphicsContext currentContext].graphicsPort;
}

#pragma mark - Gradients

- (CGGradientRef)gradientWithStartColor:(NSColor *)startingColor endColor:(NSColor *)endingColor {
    CGFloat locations[2] = {0.0f, 1.0f};
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

@end
