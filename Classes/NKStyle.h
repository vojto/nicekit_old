//
//  NKStyle.h
//  Zone
//
//  Created by Vojtech Rinik on 3/2/13.
//
//

#import "NiceKit.h"
#import "NKColor.h"
#import "NKColorGroup.h"

@interface NKStyle : NSObject

@property (assign) CGRect frame;
- (id)initWithFrame:(CGRect)frame;

// Background
@property (nonatomic, strong) NKColor *backgroundColor;
@property (nonatomic, strong) NKColorGroup *backgroundColors;


// Border
@property (assign) CGFloat borderRadius;
- (void)setBorderWidth:(CGFloat)width forSide:(NKBorderSide)side;
- (void)setBorderColor:(NKColor *)color forSide:(NKBorderSide)side;

// Shadow
- (void)addShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color;
- (void)addInsetShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color;

// Drawing
- (void)draw;

@end
