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
@property (nonatomic, assign) CGFloat borderRadius;
- (void)setBorderRadius:(CGFloat)borderRadius forSide:(NKBorderSide)side;
- (void)setBorderWidth:(CGFloat)width forSide:(NKBorderSide)side;
- (void)setBorderColor:(NKColor *)color forSide:(NKBorderSide)side;
- (NKColor *)borderColorForSide:(NKBorderSide)side;

// Shadow
- (void)addShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color;
- (void)addInsetShadow:(CGSize)offset blurRadius:(CGFloat)blurRadius color:(NKColor *)color;

// Drawing
- (void)draw;

@end
