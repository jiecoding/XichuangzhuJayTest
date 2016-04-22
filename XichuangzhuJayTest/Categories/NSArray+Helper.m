//
//  NSArray+Helper.m
//  xcz
//
//  Created by hustlzp on 15/12/24.
//  Copyright © 2015年 Zhipeng Liu. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

@end
