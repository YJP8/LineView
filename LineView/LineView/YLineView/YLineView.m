//
//  YLineView.m
//  LineView
//
//  Created by Levante on 2017/11/18.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "YLineView.h"

#define SINGLE_LINE_WIDTH (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET ((1 / [UIScreen mainScreen].scale) / 2)


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]



@implementation YLineView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        _lineStyle = YLineStyleNormal;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (nil == self.lineColor) {
        self.lineColor = RGB(218, 218, 218);
    }
    
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetShouldAntialias(context, NO);
    
    if (_lineStyle == YLineStyleDash) {
        CGFloat dash[] = {1.0, 1.0};
        CGContextSetLineDash(context, 0.0, dash, 2);
    }
    
    CGFloat width = _lineWithPx;
    
    CGFloat pixelAdjustOffset = 0;
    if (width < 1.1) {
        // 这是要画1像素线
        width = SINGLE_LINE_WIDTH;
        if (((int)(width * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
            pixelAdjustOffset = SINGLE_LINE_ADJUST_OFFSET;
        }
    }
    CGContextSetLineWidth(context, width);
    
    CGPoint pt1, pt2;
    
    if (_lineDirection == YLineDirectionLine) {
        if (self.bounds.size.height > self.bounds.size.width) {
            //竖线：
            pt1 = CGPointMake(self.bounds.size.width / 2 - pixelAdjustOffset, self.paddingStart);
            pt2 = CGPointMake(self.bounds.size.width / 2 - pixelAdjustOffset,
                              self.bounds.size.height - self.paddingEnd);
        } else {
            //横线：
            if (self.isBottomLine) {
                pt1 = CGPointMake(self.paddingStart, self.bounds.size.height - pixelAdjustOffset);
                pt2 = CGPointMake(self.bounds.size.width - self.paddingEnd,
                                  self.bounds.size.height - pixelAdjustOffset);
                
            } else {
                pt1 =
                CGPointMake(self.paddingStart, self.bounds.size.height / 2 - pixelAdjustOffset);
                pt2 = CGPointMake(self.bounds.size.width - self.paddingEnd,
                                  self.bounds.size.height / 2 - pixelAdjustOffset);
            }
        }
    } else if (_lineDirection == MCULineDirectionLeftTop2RightBottom) {
        //斜线
        pt1 = CGPointMake(self.paddingStart, self.paddingStart);
        pt2 = CGPointMake(self.bounds.size.width - self.paddingEnd,
                          self.bounds.size.height - self.paddingEnd);
    }
    CGContextMoveToPoint(context, pt1.x, pt1.y);
    CGContextAddLineToPoint(context, pt2.x, pt2.y);
    
    CGContextStrokePath(context);
}


@end
