//
//  FindingViewViewController.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FindingViewViewController.h"
#import "TestView.h"

@interface FindingViewViewController ()
{
    TestView *whiteView;
}

@end

@implementation FindingViewViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@",self.nextResponder);
}

- (void)loadView
{
    whiteView = [[TestView alloc] initWithFrame:[UIScreen mainScreen].bounds color:[UIColor whiteColor]];
    self.view = whiteView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"hitTest/pointInside寻找view";
    
    [self createViewHierachy];
}

- (void)createViewHierachy {
    
    TestView *grayView = [[TestView alloc] initWithFrame:CGRectMake(50.f, 100.f, 260.f, 200.f) color:[UIColor grayColor]];
    
    TestView *redView = [[TestView alloc] initWithFrame:CGRectMake(0.f, 0.f, 120.f, 100.f) color:[UIColor redColor]];
    
    TestView *blueView = [[TestView alloc] initWithFrame:CGRectMake(80.f, 60.f, 100.f, 100.f) color:[UIColor blueColor]];
    
    TestView *yellowView = [[TestView alloc] initWithFrame:CGRectMake(50.f, 360.f, 200.f, 200.f) color:[UIColor yellowColor]];
    
    NSLog(@"%@",blueView.nextResponder.description);
    NSLog(@"%@",redView.nextResponder.description);
    NSLog(@"%@",yellowView.nextResponder.description);
    NSLog(@"%@",grayView.nextResponder.description);
    
    [self.view addSubview:grayView];
    [grayView addSubview:redView];
    [grayView addSubview:blueView];
    [self.view addSubview:yellowView];
    
    NSLog(@"%@",blueView.nextResponder.description);
    NSLog(@"%@",redView.nextResponder.description);
    NSLog(@"%@",yellowView.nextResponder.description);
    NSLog(@"%@",grayView.nextResponder.description);
    NSLog(@"%@",whiteView.nextResponder.description);
    NSLog(@"%@",self.nextResponder.description);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchBegan", self.description);
    [super touchesBegan:touches withEvent:event];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesMoved", self.description);
    [super touchesMoved:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesEnded", self.description);
    [super touchesEnded:touches withEvent:event];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesCancelled", self.description);
    [super touchesCancelled:touches withEvent:event];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
