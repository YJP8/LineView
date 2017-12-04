//
//  ViewController.m
//  LineView
//
//  Created by Levante on 2017/11/18.
//  Copyright © 2017年 Levante. All rights reserved.
//

#import "ViewController.h"
#import "YLineView.h"
#import "UIColor+Y.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet YLineView *lineViewOne;

@property (strong, nonatomic) IBOutlet YLineView *lineViewTwo;

@property (strong, nonatomic) IBOutlet YLineView *lineViewThree;

@property (strong, nonatomic) IBOutlet UIView *codeBackGroundView;

@property (nonatomic, strong) UILabel *baseLabel;
@property (nonatomic, strong) YLineView *baseDrawLineView;

@property (nonatomic, strong) UILabel *dashLabel;
@property (nonatomic, strong) YLineView *dashDrawLineView;

@property (nonatomic, strong) UILabel *vLabel;
@property (nonatomic, strong) YLineView *vDrawLineView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // XIB creatYLineView
    // 点线
    self.lineViewOne.lineStyle = YLineStyleDash;
    self.lineViewOne.lineColor = [UIColor redColor];
    
    // 实线
    self.lineViewTwo.lineStyle = YLineStyleNormal;
    self.lineViewTwo.lineColor = [UIColor y_colorWithHexString:@"000000"];
    // 实线
    self.lineViewThree.lineStyle = YLineStyleNormal;
    self.lineViewThree.lineColor = [UIColor cyanColor];
    self.lineViewThree.isBottomLine = NO;
    
    // Code creatYLineView;
    [self.codeBackGroundView addSubview:self.baseLabel];
    [self.codeBackGroundView addSubview:self.baseDrawLineView];
    
    [self.codeBackGroundView addSubview:self.dashLabel];
    [self.codeBackGroundView addSubview:self.dashDrawLineView];
    
    [self.codeBackGroundView addSubview:self.vLabel];
    [self.codeBackGroundView addSubview:self.vDrawLineView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.baseLabel.frame = CGRectMake(8 , 34, self.view.bounds.size.width, 40);
    self.baseDrawLineView.frame = CGRectMake(0, 70, self.view.bounds.size.width, 20);
    
    self.dashLabel.frame = CGRectMake(8 , 94, self.view.bounds.size.width, 40);
    self.dashDrawLineView.frame = CGRectMake(0, 134, self.view.bounds.size.width, 20);
    
    
    self.vLabel.frame = CGRectMake(8 , 154, self.view.bounds.size.width, 40);
    //当高>宽时候认为竖线，否则认为画横线
    self.vDrawLineView.frame = CGRectMake(60, 194, 20, 180);
}

#pragma mark lazy

- (UILabel *)baseLabel {
    if (_baseLabel == nil) {
        _baseLabel = [[UILabel alloc]init];
        _baseLabel.text = @"1.基本使用";
    }
    return _baseLabel;
}

- (YLineView *)baseDrawLineView {
    if (_baseDrawLineView == nil) {
        _baseDrawLineView = [[YLineView alloc]init];
        _baseDrawLineView.lineWidthPx = 1;
        //默认线居中，开启在view的底部，一般用在花分割线，比如UITableView的cell中
        _baseDrawLineView.isBottomLine = YES;
    }
    return _baseDrawLineView;
}

- (UILabel *)dashLabel {
    if (_dashLabel == nil) {
        _dashLabel = [[UILabel alloc]init];
        _dashLabel.text = @"2.虚线使用";
    }
    return _dashLabel;
}

- (YLineView *)dashDrawLineView {
    if (_dashDrawLineView == nil) {
        _dashDrawLineView = [[YLineView alloc]init];
        //线宽度，pixel单位
        _dashDrawLineView.lineWidthPx = 1;
        //线样式
        _dashDrawLineView.lineStyle = YLineStyleDash;
        //线颜色
        _dashDrawLineView.lineColor = [UIColor redColor];
        //起点内边距
        _dashDrawLineView.paddingStart = 10;
        //结束点内边距
        _dashDrawLineView.paddingEnd = 40;
    }
    return _dashDrawLineView;
}

- (UILabel *)vLabel {
    if (_vLabel == nil) {
        _vLabel = [[UILabel alloc]init];
        _vLabel.text = @"3.竖线使用";
    }
    return _vLabel;
}

- (YLineView *)vDrawLineView {
    if (_vDrawLineView == nil) {
        _vDrawLineView = [[YLineView alloc]init];
        _vDrawLineView.lineWidthPx = 1;
        _vDrawLineView.lineColor = [UIColor cyanColor];
    }
    return _vDrawLineView;
}


@end
