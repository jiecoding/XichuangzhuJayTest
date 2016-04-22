//
//  UIImage+Helper.h
//  Albumdle
//
//  Created by hustlzp on 15/10/9.
//  Copyright © 2015年 hustlzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

@end
