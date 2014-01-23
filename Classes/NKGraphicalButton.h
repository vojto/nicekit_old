//
//  ZNGraphicalButton.h
//  Zone
//
//  Created by Vojtech Rinik on 2/19/13.
//
//

#import <Cocoa/Cocoa.h>
#import "NKGraphicalButtonCell.h"

@interface NKGraphicalButton : NSButton

@property (assign) NKGraphics *graphics;
@property (assign) CGSize graphicsSize;
@property (assign) CGSize graphicsOffset;
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, strong) NSColor *highlightColor;
@property (nonatomic, strong) NSColor *alternateColor;
@property (nonatomic, strong) NSColor *alternateHighligtColor;
@property (nonatomic, strong) NSShadow *shadow;
@property (assign) BOOL isAlternate;
@property (assign) BOOL isFirstInGroup;
@property (assign) BOOL isLastInGroup;
@property (assign) BOOL isBezeled;
@property (assign) BOOL isSelected; /** Used when bezeled */

@property (readonly) NKGraphicalButtonCell *graphicalCell;

- (id)initWithFrame:(NSRect)frameRect graphics:(Class)graphicsClass;
- (Class)cellClass;

@end
