//
//  NKColorGroup.h
//  Zone
//
//  Created by Vojtech Rinik on 3/11/13.
//
//

#import <Foundation/Foundation.h>

@interface NKColorGroup : NSObject

+ (id)groupWithColors:(NSArray *)colors;

- (id)initWithColors:(NSArray *)colors;

- (id)objectAtIndexedSubscript:(NSInteger)index;

@end
