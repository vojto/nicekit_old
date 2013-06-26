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
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, strong) NSColor *highlightColor;
@property (nonatomic, strong) NSColor *alternateColor;
@property (nonatomic, strong) NSColor *alternateHighligtColor;
@property (assign) BOOL isAlternate;

@property (readonly) NKGraphicalButtonCell *graphicalCell;

- (id)initWithFrame:(NSRect)frameRect graphics:(Class)graphicsClass;

@end
