//
//  ZNButtonCell.h
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKStyle.h"
#import "NKColorGroup.h"

@interface NKButtonCell : NSButtonCell

@property (strong) NKColorGroup *defaultColors;
@property (strong) NKColorGroup *activeColors;
@property (strong) NKColorGroup *disabledColors;
@property (assign) NKColor *borderColor;
@property (assign) CGFloat borderRadius;

@end
