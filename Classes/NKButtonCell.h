//
//  ZNButtonCell.h
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKStyle.h"
#import "NKColorGroup.h"
#import "NKColor.h"

@interface NKButtonCell : NSButtonCell

@property (assign) BOOL isSetup;
@property (assign) BOOL isSelected;

@property (strong) NKStyle *defaultStyle;
@property (strong) NKStyle *activeStyle;
@property (strong) NKStyle *disabledStyle;
@property (strong) NKStyle *selectedStyle;

@end
