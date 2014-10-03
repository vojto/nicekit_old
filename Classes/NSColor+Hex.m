//
//  NSColor+Hex.m
//
//  Created by Michael Robinson on 4/12/11.
//  License: http://pagesofinterest.net/license/
//

#import "NSColor+Hex.h"

@implementation NSColor (Hex)

static NSMutableDictionary *colorCache() {
    static NSMutableDictionary *dict = NULL;
    if(dict == NULL) {
        dict = [[NSMutableDictionary alloc] init];
    }
    return dict;
}

+ (NSColor *) colorWithHex:(NSString *)hexColor {

    NSMutableDictionary *cache = colorCache();
    id existing = [cache objectForKey:hexColor];
    if (existing) {
        return existing;
    }
    
    CGFloat opacity = 1;
    NSArray *comps = [hexColor componentsSeparatedByString:@","];
    if (comps.count == 2) {
        hexColor = comps[0];
        NSString *opacityString = comps[1];
        opacity = [opacityString floatValue];
    }

    if ([hexColor isEqualToString:@"red"]) {
        return [NSColor redColor];
    } else if ([hexColor isEqualToString:@"yellow"]) {
        return [NSColor yellowColor];
    } else if ([hexColor isEqualToString:@"green"]) {
        return [NSColor greenColor];
    } else if ([hexColor isEqualToString:@"blue"]) {
        return [NSColor blueColor];
    } else if ([hexColor isEqualToString:@"purple"]) {
        return [NSColor purpleColor];
    } else if ([hexColor isEqualToString:@"orange"]) {
        return [NSColor orangeColor];
    } else if ([hexColor isEqualToString:@"black"]) {
        return [NSColor blackColor];
    } else if ([hexColor isEqualToString:@"white"]) {
        return [NSColor whiteColor];
    }

    // Remove the hash if it exists
    hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    int length = (int)[hexColor length];
    bool triple = (length == 3);
    
    NSMutableArray *rgb = [[NSMutableArray alloc] init];
    
    // Make sure the string is three or six characters long
    if (triple || length == 6) {
        
        CFIndex i = 0;
        UniChar character = 0;
        NSString *segment = @"";
        CFStringInlineBuffer buffer;
        CFStringInitInlineBuffer((CFStringRef)hexColor, &buffer, CFRangeMake(0, length));
        
        
        while ((character = CFStringGetCharacterFromInlineBuffer(&buffer, i)) != 0 ) {
            if (triple) segment = [segment stringByAppendingFormat:@"%c%c", character, character];
            else segment = [segment stringByAppendingFormat:@"%c", character];
            
            if ((int)[segment length] == 2) {
                NSScanner *scanner = [[NSScanner alloc] initWithString:segment];
                
                unsigned number;
                
                while([scanner scanHexInt:&number]){
                    [rgb addObject:[NSNumber numberWithFloat:(float)(number / (float)255)]];
                }
                segment = @"";
            }
            
            i++;
        }
        
        // Pad the array out (for cases where we're given invalid input)
        while ([rgb count] != 3) [rgb addObject:[NSNumber numberWithFloat:0.0]];

        NSColor *color = [NSColor colorWithCalibratedRed:[[rgb objectAtIndex:0] floatValue]
                                                   green:[[rgb objectAtIndex:1] floatValue]
                                                    blue:[[rgb objectAtIndex:2] floatValue]
                                                   alpha:opacity];
        [cache setObject:color forKey:hexColor];

        return color;
    }
    else {
        NSException* invalidHexException = [NSException exceptionWithName:@"InvalidHexException"
                                                                   reason:@"Hex color not three or six characters excluding hash"                                    
                                                                 userInfo:nil];
        @throw invalidHexException;
        
    }
    
}

- (NSString *) hexColor {
    
    // Convert colour to RGBA
    NSColor *rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    
    return [NSString stringWithFormat:@"#%0.2X%0.2X%0.2X",
            (int)([rgb redComponent] * 255),
            (int)([rgb greenComponent] * 255),
            (int)([rgb blueComponent] * 255)];
}

@end
