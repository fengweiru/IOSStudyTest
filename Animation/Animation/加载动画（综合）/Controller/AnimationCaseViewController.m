//
//  AnimationCaseViewController.m
//  Animation
//
//  Created by fengweiru on 2018/8/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "AnimationCaseViewController.h"
#import "LoadingAnimationView.h"

@interface AnimationCaseViewController ()

@property (nonatomic, strong) LoadingAnimationView *loadingView;

@end

@implementation AnimationCaseViewController

- (LoadingAnimationView *)loadingView
{
    if (!_loadingView) {
        _loadingView = [[LoadingAnimationView alloc] init];
    }
    return _loadingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loadingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
