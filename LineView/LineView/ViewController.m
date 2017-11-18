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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lineViewOne.lineStyle = YLineStyleDash;
    self.lineViewOne.lineColor = [UIColor redColor];
    
    self.lineViewTwo.lineStyle = YLineStyleNormal;
    self.lineViewTwo.lineColor = [UIColor y_colorWithHexString:@"000000"];
    self.lineViewTwo.lineDirection = MCULineDirectionLeftTop2RightBottom;
    
    self.lineViewThree.lineStyle = YLineStyleNormal;
    self.lineViewThree.lineColor = [UIColor cyanColor];
    self.lineViewThree.isBottomLine = NO;
}

@end
