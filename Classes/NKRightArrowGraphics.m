//
//  ZNRightArrowGraphics.m
//  
//
//  Created by Vojtech Rinik on 2/20/13.
//
//

#import "NKRightArrowGraphics.h"

@implementation NKRightArrowGraphics

- (NSBezierPath *)bezierPath {
    NSBezierPath* bezierPath = [NSBezierPath bezierPath];
    [bezierPath moveToPoint: NSMakePoint(20.01, 39.99)];
    [bezierPath curveToPoint: NSMakePoint(39.78, 20.1) controlPoint1: NSMakePoint(30.93, 39.99) controlPoint2: NSMakePoint(39.78, 31.08)];
    [bezierPath curveToPoint: NSMakePoint(20.01, 0.2) controlPoint1: NSMakePoint(39.78, 9.11) controlPoint2: NSMakePoint(30.93, 0.2)];
    [bezierPath curveToPoint: NSMakePoint(0.24, 20.1) controlPoint1: NSMakePoint(9.1, 0.2) controlPoint2: NSMakePoint(0.24, 9.11)];
    [bezierPath curveToPoint: NSMakePoint(20.01, 39.99) controlPoint1: NSMakePoint(0.25, 31.08) controlPoint2: NSMakePoint(9.1, 39.99)];
    [bezierPath closePath];
    [bezierPath moveToPoint: NSMakePoint(20.01, 35.66)];
    [bezierPath curveToPoint: NSMakePoint(4.54, 20.1) controlPoint1: NSMakePoint(11.5, 35.66) controlPoint2: NSMakePoint(4.54, 28.74)];
    [bezierPath curveToPoint: NSMakePoint(20.01, 4.53) controlPoint1: NSMakePoint(4.54, 11.54) controlPoint2: NSMakePoint(11.5, 4.53)];
    [bezierPath curveToPoint: NSMakePoint(35.48, 20.1) controlPoint1: NSMakePoint(28.61, 4.53) controlPoint2: NSMakePoint(35.48, 11.54)];
    [bezierPath curveToPoint: NSMakePoint(20.01, 35.66) controlPoint1: NSMakePoint(35.48, 28.74) controlPoint2: NSMakePoint(28.61, 35.66)];
    [bezierPath closePath];
    [bezierPath moveToPoint: NSMakePoint(20.53, 23.99)];
    [bezierPath lineToPoint: NSMakePoint(20.53, 28.92)];
    [bezierPath lineToPoint: NSMakePoint(28.69, 20.09)];
    [bezierPath lineToPoint: NSMakePoint(20.53, 11.36)];
    [bezierPath lineToPoint: NSMakePoint(20.53, 16.2)];
    [bezierPath lineToPoint: NSMakePoint(11.76, 16.2)];
    [bezierPath lineToPoint: NSMakePoint(11.76, 23.99)];
    [bezierPath lineToPoint: NSMakePoint(20.53, 23.99)];
    [bezierPath lineToPoint: NSMakePoint(20.53, 23.99)];
    [bezierPath closePath];
    return bezierPath;
}

@end
