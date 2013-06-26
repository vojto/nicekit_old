//
//  ZNGraphics.h
//  Zone
//
//  Created by Vojtech Rinik on 2/20/13.
//
//

#import <Foundation/Foundation.h>

@interface NKGraphics : NSObject

+ (id)graphics;

- (NSBezierPath *)bezierPath;
- (NSBezierPath *)fitBezierPathInFrame:(NSRect)frame;
- (CGSize)size;

- (void)drawInFrame:(NSRect)frame color:(NSColor *)color;

@end
