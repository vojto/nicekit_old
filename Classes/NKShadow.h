//
//  NKShadow.h
//  Zone
//
//  Created by Vojtech Rinik on 3/2/13.
//
//

#import "NKColor.h"

@interface NKShadow : NSObject

@property (assign) CGSize offset;
@property (assign) CGFloat blurRadius;
@property (nonatomic, strong) NKColor *color;
@property (assign) BOOL isInset;

@end
