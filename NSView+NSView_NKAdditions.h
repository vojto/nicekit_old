//
//  NSView+NSView_NKAdditions.h
//  Pods
//
//  Created by Vojtech Rinik on 18/02/14.
//
//

#import <Cocoa/Cocoa.h>

@interface NSView (NSView_NKAdditions)

- (void)addSameAttributeConstraint:(NSLayoutAttribute)attribute toView:(NSView *)otherView;
- (void)addCenteringConstraintsToView:(NSView *)otherView;
- (void)addSizeConstraint:(NSSize)size;
- (void)disableAutoResizingConstraints;


@end
