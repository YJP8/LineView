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

@interface YLineView : UIView

@property(assign, nonatomic) YLineStyle lineStyle;

/**
 线宽 px
 */
@property(assign, nonatomic) CGFloat lineWidthPx;
/**
 线起点边距
 */
@property(assign, nonatomic) CGFloat paddingStart;
/**
 线结束边距
 */
@property(assign, nonatomic) CGFloat paddingEnd;
/**
 线的颜色
 */
@property(copy, nonatomic) UIColor *lineColor;
/**
 是否是底部
 */
@property(assign, nonatomic) BOOL isBottomLine;

@end
