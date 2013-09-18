//
//  ZNGraphicalButtonCell.m
//  Zone
//
//  Created by Vojtech Rinik on 2/19/13.
//
//

#import "NiceKit.h"
#import "NKGraphicalButtonCell.h"
#import "NKRightArrowGraphics.h"

@implementation NKGraphicalButtonCell

- (id)init {
    if ((self = [super init])) {
        [self setup];
    }
    return self;
}

- (id)initWithGraphics:(Class)graphicsClass {
    if ((self = [self init])) {
        self.graphics = [graphicsClass graphics];
    }
    return self;
}

- (void)awakeFromNib {
    [self setup];
    self.graphicsSize = CGSizeZero;
    self.graphicsOffset = CGSizeZero;
}

- (void)setup {
    self.color = [NSColor colorWithHex:@"9e5fcc"];
    self.highlightColor = [NSColor colorWithHex:@"7c48a2"];
    self.disabledColor = [NSColor colorWithHex:@"c1c0c2"];
    self.alternateColor = [NSColor colorWithHex:@"a8a4ab"];
    self.alternateHighligtColor = [NSColor colorWithHex:@"88858b"];
    self.graphics = [NKRightArrowGraphics graphics];
    self.isAlternate = NO;
    self.isSelected = NO;
    
    self.style = [[NKStyle alloc] initWithFrame:CGRectZero];

    self.shadow = [[NSShadow alloc] init];
    self.shadow.shadowOffset = CGSizeMake(0, -1.0);
    self.shadow.shadowBlurRadius = 0.0;
    self.shadow.shadowColor = [NSColor whiteColor];
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {

    // Button style
    self.style.frame = NSInsetRect(frame, 0.0, 1.0);

    if (self.isBezeled) {
        if (self.isHighlighted) {
            self.style.backgroundColors = [NKColorGroup groupWithColors:@[
                                           [NKColor colorWithHex:@"f7f7f7"],
                                           [NKColor colorWithHex:@"dddddd"]
                                           ]];
        } else if (self.isSelected) {
            self.style.backgroundColors = [NKColorGroup groupWithColors:@[
                                           [NKColor colorWithHex:@"fafafa"],
                                           [NKColor colorWithHex:@"e3e3e3"]
                                           ]];
        } else {
            self.style.backgroundColors = [NKColorGroup groupWithColors:@[
                                           [NKColor colorWithHex:@"e3e3e3"],
                                           [NKColor colorWithHex:@"fafafa"]
                                           ]];
        }
        self.style.borderRadius = 3.0;
        [self.style setBorderColor:[NKColor colorWithHex:@"c3c3c3"] forSide:kNKBorderAll];
        [self.style setBorderWidth:1.0 forSide:kNKBorderAll];
        [self.style addShadow:CGSizeMake(0.0, -1.0) blurRadius:0.0 color:[NKColor colorWithHex:@"fbfbfb"]];
    }

    if (self.isFirstInGroup) {
        [self.style setBorderRadius:0.0 forSide:kNKBorderRight];
        [self.style setBorderRadius:0.0 forSide:kNKBorderBottom];
        [self.style setBorderRadius:3.0 forSide:kNKBorderLeft];
        [self.style setBorderRadius:3.0 forSide:kNKBorderTop];
//        self.style.backgroundColor = [NKColor colorWithHex:@"orange"];
    }
    if (self.isLastInGroup) {
        [self.style setBorderRadius:3.0 forSide:kNKBorderRight];
        [self.style setBorderRadius:3.0 forSide:kNKBorderBottom];
        [self.style setBorderRadius:0.0 forSide:kNKBorderLeft];
        [self.style setBorderRadius:0.0 forSide:kNKBorderTop];
    }
    [self.style draw];

    // Button graphics

    NSBezierPath *bezierPath;

    if (!CGSizeEqualToSize(self.graphicsSize, CGSizeZero)) {
        bezierPath = [self.graphics fitBezierPathInFrame:CGRectMake(0, 0, self.graphicsSize.width, self.graphicsSize.height)];
    } else {
        bezierPath = [self.graphics fitBezierPathInFrame:frame];
    }

    if (!CGSizeEqualToSize(self.graphicsOffset, CGSizeZero)) {
        NSAffineTransform *t = [NSAffineTransform transform];
        [t translateXBy:self.graphicsOffset.width yBy:self.graphicsOffset.height];
        [bezierPath transformUsingAffineTransform:t];
    }

    if (!self.isEnabled) {
        [self.disabledColor setFill];
    } else if (self.isHighlighted && self.isAlternate) {
        [self.alternateHighligtColor setFill];
    } else if (self.isHighlighted) {
        [self.highlightColor setFill];
    } else if (self.isAlternate) {
        [self.alternateColor setFill];
    } else {
        [self.color setFill];
    }

    [self.shadow set];
    [bezierPath fill];
}

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView {
    CGFloat xOffset = 10.0;
    CGFloat yOffset = 1.0;
    frame.size.width -= xOffset;
    frame.origin.x += xOffset;
    frame.size.height -= yOffset;
    frame.origin.y -= yOffset;

    if (self.isHighlighted) {
        NSMutableAttributedString *mutableTitle = [title mutableCopy];
        [mutableTitle addAttribute:NSForegroundColorAttributeName value:self.highlightColor range:NSMakeRange(0, title.length)];
        return [super drawTitle:mutableTitle withFrame:frame inView:controlView];
    } else {
        return [super drawTitle:title withFrame:frame inView:controlView];
    }


}

@end
