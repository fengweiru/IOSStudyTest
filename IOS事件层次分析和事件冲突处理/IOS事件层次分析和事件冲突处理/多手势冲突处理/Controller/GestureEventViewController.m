//
//  GestureEventViewController.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "GestureEventViewController.h"
#import "ViewOne.h"
#import "ViewTwo.h"
#import "PanGestureOne.h"
#import "PanGestureTwo.h"

@interface GestureEventViewController ()

@end

@implementation GestureEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多手势冲突处理";
    
    [self setupUI];
}

- (void)setupUI
{
    ViewOne *redView = [[ViewOne alloc] initWithFrame:CGRectMake(100.f, 100.f, 140.f, 140.f)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    ViewTwo *yellowView = [[ViewTwo alloc] initWithFrame:CGRectMake(30.f, 30.f, 80.f, 80.f)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [redView addSubview:yellowView];
    
    
    PanGestureOne *gestureOne = [[PanGestureOne alloc] initWithTarget:self action:@selector(redPanAction)];
    [redView addGestureRecognizer:gestureOne];
    
    PanGestureTwo *gestureTwo = [[PanGestureTwo alloc] initWithTarget:self action:@selector(yellowPanAction)];
    [yellowView addGestureRecognizer:gestureTwo];
    
//    //让gestureTwo响应优先级低于gestureOne
//    [gestureTwo requireGestureRecognizerToFail:gestureOne];
}

- (void)redPanAction
{
    NSLog(@"%s", __func__);
}

- (void)yellowPanAction
{
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
