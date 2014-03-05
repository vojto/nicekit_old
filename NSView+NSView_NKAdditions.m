//
//  NSView+NSView_NKAdditions.m
//  Pods
//
//  Created by Vojtech Rinik on 18/02/14.
//
//

#import "NSView+NSView_NKAdditions.h"

@implementation NSView (NSView_NKAdditions)

- (void)addSameAttributeConstraint:(NSLayoutAttribute)attribute toView:(NSView *)otherView {
    NSLayoutConstraint *c;
    
    c = [NSLayoutConstraint constraintWithItem:self
                                     attribute:attribute
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:otherView
                                     attribute:attribute
                                    multiplier:1.0
                                      constant:0.0];
    [self addConstraint:c];
}

- (void)addCenteringConstraintsToView:(NSView *)otherView {
    [self addSameAttributeConstraint:NSLayoutAttributeCenterY toView:otherView];
    [self addSameAttributeConstraint:NSLayoutAttributeCenterX toView:otherView];
}

- (void)addConstantConstraint:(NSLayoutAttribute)attribute value:(CGFloat)value {
    NSLayoutConstraint *c = [NSLayoutConstraint
                             constraintWithItem:self
                             attribute:attribute
                             relatedBy:NSLayoutRelationEqual
                             toItem:nil
                             attribute:NSLayoutAttributeNotAnAttribute
                             multiplier:1.0
                             constant:value];
    [self addConstraint:c];
}

- (void)addSizeConstraint:(NSSize)size {
    [self addConstantConstraint:NSLayoutAttributeWidth value:size.width];
    [self addConstantConstraint:NSLayoutAttributeHeight value:size.height];
}

- (void)disableAutoResizingConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

@end
