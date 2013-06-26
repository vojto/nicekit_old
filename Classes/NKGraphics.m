//
//  ZNGraphics.m
//  Zone
//
//  Created by Vojtech Rinik on 2/20/13.
//
//

#import "NKGraphics.h"

@implementation NKGraphics

+ (id)graphics {
    return [[self alloc] init];
}

- (NSBezierPath *)bezierPath {
    [NSException raise:@"Implement bezierPath in the subclass" format:nil];
    return nil;
}

- (CGSize)size {
    return CGSizeMake(40.0, 40.0);
}

- (NSBezierPath *)fitBezierPathInFrame:(NSRect)frame {
    NSAffineTransform *transform = [NSAffineTransform transform];
    [transform translateXBy:frame.origin.x yBy:frame.origin.y];
    [transform scaleXBy:(frame.size.width/self.size.width) yBy:(frame.size.height/self.size.height)];
    NSBezierPath *transformed = [self.bezierPath copy];
    [transformed transformUsingAffineTransform:transform];
    return transformed;
}

- (void)drawInFrame:(NSRect)frame color:(NSColor *)color {
    NSBezierPath *path = [self fitBezierPathInFrame:frame];
    [color setFill];
    [path fill];
}

@end
