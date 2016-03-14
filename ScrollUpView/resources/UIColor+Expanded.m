//
//  UIColor+Expanded.m
//  GrabCoupons
//
//  Created by 李潇 on 15/3/23.
//  Copyright (c) 2015年 lixiao. All rights reserved.
//

#import "UIColor+Expanded.h"

@implementation UIColor (Expanded)
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(float)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    return [self colorWithHexString:stringToConvert andAlpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [UIColor colorWithRGBHex:hexNum alpha:alpha];
}

@end
