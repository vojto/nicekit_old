//
//  ZNGraphicalButton.m
//  Zone
//
//  Created by Vojtech Rinik on 2/19/13.
//
//

#import "NKGraphicalButton.h"

@implementation NKGraphicalButton

- (id)initWithFrame:(NSRect)frameRect {
    if ((self = [super initWithFrame:frameRect])) {
        self.cell = [[NKGraphicalButtonCell alloc] init];
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect graphics:(Class)graphicsClass {
    if ((self = [super initWithFrame:frameRect])) {
        self.cell = [[NKGraphicalButtonCell alloc] initWithGraphics:[graphicsClass class]];
        self.title = @"";
        [self setup];
    }
    return self;
}

- (void)setup {
    self.bezelStyle = NSRegularSquareBezelStyle;
    self.color = [NSColor redColor];
}

- (NKGraphicalButtonCell *)graphicalCell {
    return (NKGraphicalButtonCell *)self.cell;
}

- (NKGraphics *)graphics {
    return self.graphicalCell.graphics;
}

- (void)setGraphics:(NKGraphics *)graphics {
    self.graphicalCell.graphics = graphics;
}

- (BOOL)isAlternate {
    return self.graphicalCell.isAlternate;
}

- (void)setIsAlternate:(BOOL)isAlternate {
    self.graphicalCell.isAlternate = isAlternate;
}

- (CGSize)graphicsSize {
    return self.graphicalCell.graphicsSize;
}

- (void)setGraphicsSize:(CGSize)graphicsSize {
    self.graphicalCell.graphicsSize = graphicsSize;
}

#pragma mark - Color

- (void)setColor:(NSColor *)color {
    _color = color;
    self.graphicalCell.color = color;
    self.title = self.title;
}

- (NSColor *)highlightColor {
    return self.graphicalCell.highlightColor;
}

- (void)setHighlightColor:(NSColor *)highlightColor {
    self.graphicalCell.highlightColor = highlightColor;
}

- (NSColor *)alternateColor {
    return self.graphicalCell.alternateColor;
}

- (void)setAlternateColor:(NSColor *)alternateColor {
    self.graphicalCell.alternateColor = alternateColor;
}

- (NSColor *)alternateHighligtColor {
    return self.graphicalCell.alternateHighligtColor;
}

- (void)setAlternateHighligtColor:(NSColor *)alternateHighligtColor {
    self.graphicalCell.alternateHighligtColor = alternateHighligtColor;
}

#pragma mark - Title

- (void)setTitle:(NSString *)aString {
    if (aString.length == 0) {
        self.attributedTitle = [[NSAttributedString alloc] initWithString:@""];
        return;
    }
    NSFont *font = [NSFont fontWithName:@"HelveticaNeue" size:13.0];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, -1.0);
    shadow.shadowBlurRadius = 0.0;
    shadow.shadowColor = [NSColor whiteColor];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSForegroundColorAttributeName:self.color, NSShadowAttributeName:shadow};
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:aString attributes:attributes];

    self.attributedTitle = attributedTitle;
}



@end
