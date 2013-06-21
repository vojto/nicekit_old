//
//  NKColor.h
//  Zone
//
//  Created by Vojtech Rinik on 3/2/13.
//
//

#import <Foundation/Foundation.h>

@interface NKColor : NSObject

@property (nonatomic, strong) NSColor *color;

+ (NKColor *)colorWithColor:(NSColor *)color;
+ (NKColor *)colorWithHex:(NSString *)hex;
+ (NKColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;
+ (NKColor *)redColor;

- (id)initWithColor:(NSColor *)color;

- (CGColorRef)CGColor;

@end
