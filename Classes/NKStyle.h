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

// Font
// this one isnt't used for drawing, because NKStyle doesn't really draw any text
// but some other classes may use it do their own drawing of text, and it such
// cases we want the font style information to be associated with the style.
// nil by default.
@property (strong) NSColor *textColor;
@property (strong) NSShadow *textShadow;

// Drawing
- (void)draw;



@end
