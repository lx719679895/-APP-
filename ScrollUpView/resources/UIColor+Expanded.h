//
//  UIColor+Expanded.h
//  GrabCoupons
//
//  Created by 李潇 on 15/3/23.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Expanded)

+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;

@end
