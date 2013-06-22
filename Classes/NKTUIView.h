//
//  NKTUIView.h
//  Zone
//
//  Created by Vojtech Rinik on 2/20/13.
//
//

#ifdef TUIView

#import "TUIView.h"

@interface NKTUIView : TUIView

#pragma mark - Drawing

- (void)nk_drawBackground:(NSString *)color;
- (void)nk_drawBorder:(NKBorderSide)side lineWidth:(CGFloat)lineWidth color:(NSString *)color;
- (void)nk_drawGradientStartColor:(NSString *)startColor endColor:(NSString *)endColor;

@end

#endif