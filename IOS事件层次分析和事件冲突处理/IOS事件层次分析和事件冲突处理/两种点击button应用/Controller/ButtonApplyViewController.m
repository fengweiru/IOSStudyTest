//
//  ButtonApplyViewController.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "ButtonApplyViewController.h"
#import "ExpandButton.h"
#import "SuperView.h"

@interface ButtonApplyViewController ()

@end

@implementation ButtonApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"两种点击button的应用";
    
    [self setupUI];
}

- (void)setupUI
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UILabel *expandLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 200, 30)];
    expandLabel.text = @"扩大button的点击范围:";
    [self.view addSubview:expandLabel];
    ExpandButton *expandButton = [ExpandButton buttonWithType:UIButtonTypeCustom];
    [expandButton setBackgroundColor:[UIColor grayColor]];
    expandButton.frame = CGRectMake(150, 120, 20, 20);
    [expandButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:expandButton];
    
    UILabel *clickLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 250, 50)];
    clickLabel.numberOfLines = 2;
    clickLabel.text = @"button显示范围超出superview，让点击生效:";
    [self.view addSubview:clickLabel];
    SuperView *superView = [[SuperView alloc] initWithFrame:CGRectMake(30, 280, 260, 40)];
    superView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:superView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, -20, 60, 60);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
}

- (void)buttonClick:(UIButton *)sender
{
    NSLog(@"%@ click",sender.description);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
