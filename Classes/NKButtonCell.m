//
//  ZNButtonCell.m
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKButtonCell.h"

@interface NKButtonCell ()

@end

@implementation NKButtonCell

- (id)init {
    if ((self = [super init])) {
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
    self.isSelected = NO;
    self.font = [NSFont fontWithName:@"HelveticaNeue-Bold" size:11];
    self.defaultStyle = [[NKStyle alloc] initWithFrame:NSZeroRect];
    self.activeStyle = [[NKStyle alloc] initWithFrame:NSZeroRect];
    self.disabledStyle = [[NKStyle alloc] initWithFrame:NSZeroRect];
    self.selectedStyle = [[NKStyle alloc] initWithFrame:NSZeroRect];

    self.defaultStyle.backgroundColors = [NKColorGroup groupWithHexColors:@[@"f8f8f8", @"fff"]];
    self.activeStyle.backgroundColors = [NKColorGroup groupWithHexColors:@[@"fff", @"f8f8f8"]];
    self.disabledStyle.backgroundColors = [NKColorGroup groupWithHexColors:@[@"f8f8f8", @"fff"]];
    self.selectedStyle.backgroundColors = [NKColorGroup groupWithHexColors:@[@"blue", @"red"]];

    self.activeStyle.borderRadius = 0;
//    [self.activeStyle setBorderColor:[NKColor colorWithHex:@"cecbce"] forSide:kNKBorderAll];
}

- (BOOL)isOpaque {
    return YES;
}

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView {
    NKStyle *style;

    if (self.isSelected) {
        style = self.selectedStyle;
    } else if (!self.isEnabled) {
        style = self.disabledStyle;
    } else if ([self isHighlighted]) {
        style = self.activeStyle;
    } else {
        style = self.defaultStyle;
    }

    style.frame = frame;

    [style draw];
}

@end
