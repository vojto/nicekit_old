//
//  ZNButton.m
//  Zone
//
//  Created by Vojtech Rinik on 2/7/13.
//
//

#import "NKButton.h"
#import "NSColor+Hex.h"

@implementation NKButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [NSFont fontWithName:@"HelveticaNeue-Bold" size:11];
    [self setTextColor:[NSColor colorWithHex:@"666"]];
}

- (NSColor *)textColor {
    NSAttributedString *attrTitle = [self attributedTitle];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, MIN(len, 1)); // take color from first char
    NSDictionary *attrs = [attrTitle fontAttributesInRange:range];
    NSColor *textColor = [NSColor controlTextColor];
    if (attrs) {
        textColor = [attrs objectForKey:NSForegroundColorAttributeName];
    }
    return textColor;
}

- (void)setTextColor:(NSColor *)textColor {
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc]
                                            initWithAttributedString:[self attributedTitle]];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName value:textColor range:range];

    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[NSColor colorWithDeviceWhite:1.0 alpha:1]];
    [shadow setShadowOffset:NSMakeSize(1.0, -1.1)];
    [attrTitle addAttribute:NSShadowAttributeName value:shadow range:range];
    [attrTitle addAttribute:NSBaselineOffsetAttributeName value:@2.5 range:range];

    [attrTitle fixAttributesInRange:range];
    [self setAttributedTitle:attrTitle];
}

- (void)setEnabled:(BOOL)flag {
    [super setEnabled:flag];
    if (flag) {
        self.alphaValue = 1.0;
    } else {
        self.alphaValue = 0.5;
    }
}

@end
