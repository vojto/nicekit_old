//
//  NKColorGroup.m
//  Zone
//
//  Created by Vojtech Rinik on 3/11/13.
//
//

#import "NKColorGroup.h"
#import "NKColor.h"

@interface NKColorGroup ()

@property (strong) NSArray *colors;

@end

@implementation NKColorGroup

+ (id)groupWithColors:(NSArray *)colors {
    return [[NKColorGroup alloc] initWithColors:colors];
}

+ (id)groupWithHexColors:(NSArray *)colors {
    return [[NKColorGroup alloc] initWithHexColors:colors];
}

- (id)initWithColors:(NSArray *)colors {
    if ((self = [super init])) {
        self.colors = colors;
    }
    return self;
}

- (id)initWithHexColors:(NSArray *)hexColors {
    if ((self = [super init])) {
        NSMutableArray *colors = [NSMutableArray array];
        for (NSString *hexColor in hexColors) {
            NKColor *color = [NKColor colorWithHex:hexColor];
            [colors addObject:color];
        }
        self.colors = colors;
    }
    return self;
}

- (id)objectAtIndexedSubscript:(NSInteger)index {
    return self.colors[index];
}

@end
