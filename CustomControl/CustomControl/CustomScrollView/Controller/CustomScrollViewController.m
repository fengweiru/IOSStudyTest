//
//  CustomScrollViewController.m
//  CustomControl
//
//  Created by fengweiru on 2018/7/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "CustomScrollViewController.h"
#import "CustomScrollView.h"

@interface CustomScrollViewController ()

@property (nonatomic, strong) CustomScrollView *scroll;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *scrollView2;

@end

@implementation CustomScrollViewController

- (CustomScrollView *)scroll
{
    if (!_scroll) {
        _scroll = [[CustomScrollView alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width-100, 400)];
        _scroll.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width-100)*2, 800);
        _scroll.backgroundColor = [UIColor grayColor];
    }
    return _scroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"customScrollView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scroll];
    
    NSArray <UIColor *>* colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor yellowColor], nil];
    
    for (NSInteger i = 0; i < 4; i++) {
        UIView *colorView = [[UIView alloc] init];
        colorView.backgroundColor = colors[i];
        [self.scroll addSubview:colorView];
        
        switch (i) {
            case 0:
                colorView.frame = CGRectMake(0, 0, self.scroll.f_width, self.scroll.f_height);
                break;
            case 1:
                colorView.frame = CGRectMake(self.scroll.f_width, 0, self.scroll.f_width, self.scroll.f_height);
                break;
            case 2:
                colorView.frame = CGRectMake(0, self.scroll.f_height, self.scroll.f_width, self.scroll.f_height);
                break;
            case 3:
                colorView.frame = CGRectMake(self.scroll.f_width, self.scroll.f_height, self.scroll.f_width, self.scroll.f_height);
                break;
                
            default:
                break;
        }
    }
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 550, 200, 200)];
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.contentSize = CGSizeMake(400, 0);
    [self.view addSubview:_scrollView];
    _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _scrollView2.backgroundColor = [UIColor redColor];
    _scrollView2.contentSize = CGSizeMake(400, 0);
    [_scrollView addSubview:_scrollView2];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(20, 550, 50, 50);
    [self.view addSubview:button];
    
}

- (void)show
{
    NSLog(@"scrollView:%d",_scrollView.panGestureRecognizer.cancelsTouchesInView);
    NSLog(@"scrollView2:%d",_scrollView2.panGestureRecognizer.cancelsTouchesInView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
