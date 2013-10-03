//
//  ZNButton.m
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKButton.h"
#import "NSColor+Hex.h"
#import "NKButtonCell.h"

@implementation NKButton

@synthesize textColor = _textColor;

- (id)initWithFrame:(NSRect)frameRect {
    if ((self = [super initWithFrame:frameRect])) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.isShadowEnabled = YES;
    self.bezelStyle = NSRegularSquareBezelStyle;
    self.font = [NSFont fontWithName:@"HelveticaNeue-Bold" size:11];
    self.textColor = [NSColor colorWithHex:@"666"];
}

+ (Class)cellClass {
    return [NKButtonCell class];
}

- (NSColor *)textColor {
    return _textColor;
}

- (void)setTextColor:(NSColor *)textColor {
    _textColor = textColor;
    [self scheduleUpdateAttributes];
}

- (void)setIsShadowEnabled:(BOOL)isShadowEnabled {
    _isShadowEnabled = isShadowEnabled;
    [self scheduleUpdateAttributes];
}

- (void)setEnabled:(BOOL)flag {
    [super setEnabled:flag];
    if (flag) {
        self.alphaValue = 1.0;
    } else {
        self.alphaValue = 0.5;
    }
}

#pragma mark - Updating attributes

- (void)scheduleUpdateAttributes {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(updateAttributes) withObject:nil afterDelay:0];
}

- (void)updateAttributes {
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]
                                        initWithAttributedString:[self attributedTitle]];

    int len = [title length];
    NSRange range = NSMakeRange(0, len);
    if (!self.textColor) {
        NSAssert(self.textColor != nil, @"no text color");
    }
    [title addAttribute:NSForegroundColorAttributeName value:self.textColor range:range];

    // Shadow
    if (self.isShadowEnabled) {
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[NSColor colorWithDeviceWhite:1.0 alpha:1]];
        [shadow setShadowOffset:NSMakeSize(1.0, -1.1)];
        [title addAttribute:NSShadowAttributeName value:shadow range:range];
    } else {
        [title removeAttribute:NSShadowAttributeName range:range];
    }

    // [attrTitle addAttribute:NSBaselineOffsetAttributeName value:@2.5 range:range];

    [title fixAttributesInRange:range];

    [self setAttributedTitle:title];
}

#pragma mark - Selected

- (BOOL)isSelected {
    NKButtonCell *cell = (NKButtonCell *)self.cell;
    return cell.isSelected;
}

- (void)setIsSelected:(BOOL)isSelected {
    NKButtonCell *cell = (NKButtonCell *)self.cell;
    cell.isSelected = isSelected;
    [self setNeedsDisplay:YES];
}

@end
