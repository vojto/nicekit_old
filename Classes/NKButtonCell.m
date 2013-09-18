//
//  ZNButtonCell.m
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKButtonCell.h"

@interface NKButtonCell ()

@property (strong) NKStyle *style;

@end

@implementation NKButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [NSFont fontWithName:@"HelveticaNeue-Bold" size:11];
    self.style = [[NKStyle alloc] initWithFrame:NSZeroRect];
    self.defaultColors = [NKColorGroup groupWithHexColors:@[@"f8f8f8", @"fff"]];
    self.activeColors = [NKColorGroup groupWithHexColors:@[@"fff", @"f8f8f8"]];
    self.disabledColors = [NKColorGroup groupWithHexColors:@[@"f8f8f8", @"fff"]];
    self.borderRadius = 3.0;
    self.borderColor = [NKColor colorWithHex:@"cecbce"];
}

- (void)setBorderColor:(NKColor *)borderColor {
    [self.style setBorderColor:borderColor forSide:kNKBorderAll];
}

- (NKColor *)borderColor {
    return [self.style borderColorForSide:kNKBorderAll];
}

- (void)setBorderRadius:(CGFloat)radius {
    [self.style setBorderRadius:radius];
}

- (CGFloat)borderRadius {
    return self.style.borderRadius;
}

- (BOOL)isOpaque {
    return YES;
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {

    // Set frame
    self.style.frame = frame;

    // Set color scheme
    if (!self.isEnabled) {
        self.style.backgroundColors = self.disabledColors;
    } else if ([self isHighlighted]) {
        self.style.backgroundColors = self.activeColors;
    } else {
        self.style.backgroundColors = self.activeColors;
    }

    [self.style draw];
}

@end
