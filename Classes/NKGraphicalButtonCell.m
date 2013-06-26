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
}

- (void)setup {
    self.color = [NSColor colorWithHex:@"9e5fcc"];
    self.highlightColor = [NSColor colorWithHex:@"7c48a2"];
    self.disabledColor = [NSColor colorWithHex:@"c1c0c2"];
    self.alternateColor = [NSColor colorWithHex:@"a8a4ab"];
    self.alternateHighligtColor = [NSColor colorWithHex:@"88858b"];
    self.graphics = [NKRightArrowGraphics graphics];
    self.isAlternate = NO;
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    NSBezierPath *bezierPath;

    if (!CGSizeEqualToSize(self.graphicsSize, CGSizeZero)) {
        bezierPath = [self.graphics fitBezierPathInFrame:CGRectMake(0, 0, self.graphicsSize.width, self.graphicsSize.height)];
    } else {
        bezierPath = [self.graphics fitBezierPathInFrame:frame];
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

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, -1.0);
    shadow.shadowBlurRadius = 0.0;
    shadow.shadowColor = [NSColor whiteColor];
    [shadow set];
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
