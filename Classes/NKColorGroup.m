//
//  NKColorGroup.m
//  Zone
//
//  Created by Vojtech Rinik on 3/11/13.
//
//

#import "NKColorGroup.h"

@interface NKColorGroup ()

@property (strong) NSArray *colors;

@end

@implementation NKColorGroup

+ (id)groupWithColors:(NSArray *)colors {
    return [[NKColorGroup alloc] initWithColors:colors];
}

- (id)initWithColors:(NSArray *)colors {
    if ((self = [super init])) {
        self.colors = colors;
    }
    return self;
}

- (id)objectAtIndexedSubscript:(NSInteger)index {
    return self.colors[index];
}

@end
