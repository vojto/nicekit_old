//
//  ZNGraphicalButtonCell.h
//  Zone
//
//  Created by Vojtech Rinik on 2/19/13.
//
//

#import "NiceKit.h"
#import "NKGraphics.h"

@interface NKGraphicalButtonCell : NSButtonCell

@property (strong) NKGraphics *graphics;
@property (assign) CGSize graphicsSize;
@property (assign) CGSize graphicsOffset;

@property (strong) NKStyle *style;
@property (strong) NSShadow *shadow;

@property (strong) NSColor *color;
@property (strong) NSColor *highlightColor;
@property (strong) NSColor *disabledColor;
@property (strong) NSColor *alternateColor;
@property (strong) NSColor *alternateHighligtColor;

@property (assign) BOOL isAlternate; /** Alternate, such as back button */
@property (assign) BOOL isFirstInGroup;
@property (assign) BOOL isLastInGroup;
@property (assign) BOOL isBezeled;
@property (assign) BOOL isSelected; /** Used when bezeled */

- (id)initWithGraphics:(Class)graphicsClass;

@end
