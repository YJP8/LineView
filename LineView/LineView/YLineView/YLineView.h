//
//  YLineView.h
//  LineView
//
//  Created by Levante on 2017/11/18.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 线样式
 */
typedef NS_ENUM(NSInteger, YLineStyle) {
    //实线
    YLineStyleNormal,
    //点线
    YLineStyleDash
};


/**
 线方向
 */
typedef NS_ENUM(NSInteger, YLineDirection) {
    //横线 竖线
    YLineDirectionLine,
    //斜线
    MCULineDirectionLeftTop2RightBottom
};

@interface YLineView : UIView

@property(assign, nonatomic) YLineStyle lineStyle;

@property(assign, nonatomic) CGFloat linePx;

@property(assign, nonatomic) CGFloat marginOne;

@property(assign, nonatomic) CGFloat marginTwo;

@property(copy, nonatomic) UIColor *lineColor;

@property(assign, nonatomic) BOOL isBottomLine;

@property(assign, nonatomic) YLineDirection lineDirection;

@end
