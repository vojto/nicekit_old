//
//  ZNGraphicalButtonCell.h
//  Zone
//
//  Created by Vojtech Rinik on 2/19/13.
//
//

#import "NKGraphics.h"

@interface NKGraphicalButtonCell : NSButtonCell

@property (strong) NKGraphics *graphics;
@property (assign) CGSize graphicsSize;

@property (strong) NSColor *color;
@property (strong) NSColor *highlightColor;
@property (strong) NSColor *disabledColor;
@property (strong) NSColor *alternateColor;
@property (strong) NSColor *alternateHighligtColor;

@property (assign) BOOL isAlternate; /** Alternate, such as back button */

- (id)initWithGraphics:(Class)graphicsClass;

@end
