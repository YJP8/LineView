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
#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]



@implementation YLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    self.backgroundColor = [UIColor clearColor];
    _lineStyle = YLineStyleNormal;
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
    
    CGFloat width = _lineWidthPx;
    CGFloat pixelAdjustOffset = 0;
    if (width < 1.1) {
        // 这是要画1像素线
        width = SINGLE_LINE_WIDTH;
        if (((int)(width * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
            pixelAdjustOffset = SINGLE_LINE_ADJUST_OFFSET;
        }
    }
    CGContextSetLineWidth(context, width);
    
    CGPoint startPoint, endPoint;
    if (VIEW_HEIGHT > VIEW_WIDTH) {
        //竖线：
        startPoint = CGPointMake(VIEW_WIDTH / 2 - pixelAdjustOffset, self.paddingStart);
        endPoint = CGPointMake(VIEW_WIDTH / 2 - pixelAdjustOffset,
                          VIEW_HEIGHT - self.paddingEnd);
    } else {
        //横线：
        if (self.isBottomLine) {
            startPoint = CGPointMake(self.paddingStart, VIEW_HEIGHT - pixelAdjustOffset);
            endPoint = CGPointMake(VIEW_WIDTH - self.paddingEnd,
                              VIEW_HEIGHT - pixelAdjustOffset);
            
        } else {
            startPoint =
            CGPointMake(self.paddingStart, VIEW_HEIGHT / 2 - pixelAdjustOffset);
            endPoint = CGPointMake(VIEW_WIDTH - self.paddingEnd,
                              VIEW_HEIGHT / 2 - pixelAdjustOffset);
        }
    }
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    
    CGContextStrokePath(context);
}


@end

