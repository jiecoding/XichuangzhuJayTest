//
//  NSString+Helper.m
//  xcz
//
//  Created by hustlzp on 15/12/28.
//  Copyright © 2015年 Zhipeng Liu. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (NSArray *)toArray
{
    NSMutableArray *chars = [[NSMutableArray alloc] initWithCapacity:[self length]];
    
    for (int i=0; i < [self length]; i++) {
        NSString *ichar  = [NSString stringWithFormat:@"%C", [self characterAtIndex:i]];
        [chars addObject:ichar];
    }
    
    return chars;
}

@end
