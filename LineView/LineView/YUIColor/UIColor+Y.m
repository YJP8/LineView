//
//  UIColor+Y.m
//  LineView
//
//  Created by Levante on 2017/11/18.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "UIColor+Y.h"

@implementation UIColor (Y)

+ (nullable UIColor *)y_colorWithHexString:(NSString *_Nullable)hexStr {
    CGFloat r, g, b, a;
    if (y_hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

static BOOL y_hexStrToRGBA(NSString *str,
                            CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [[str stringByTrimmingCharactersInSet:set] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = y_hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = y_hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = y_hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = y_hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = y_hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = y_hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = y_hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = y_hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

+ (nullable UIColor *)y_colorWithHexString:(NSString *_Nullable)hexStr alpha:(CGFloat)alpha{
    CGFloat r, g, b, a;
    if (y_hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    }
    return nil;
}

static inline NSUInteger y_hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

@end
