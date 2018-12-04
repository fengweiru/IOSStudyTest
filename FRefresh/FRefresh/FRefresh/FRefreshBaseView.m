//
//  FRefreshBaseView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshBaseView.h"

@implementation FRefreshBaseView

- (instancetype)init
{
    if (self = [super init]) {
    
        [self prepare];
    }
    return self;
}

- (void)prepare
{
    self.alpha = 0;
    self.alphaChange = true;
    self.state = FRefreshStateIdle;
    self.backgroundColor = [UIColor orangeColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self placeSubview];
    
    if (self.state == FRefreshStateWillRefresh) {
        self.state = FRefreshStateRefreshing;
    }
}

- (void)placeSubview
{
    self.originalInset = self.scrollView.f_inset;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    UIScrollView *oldScrollView = (UIScrollView *)self.superview;
    
    [self.superview removeObserver:self forKeyPath:@"contentOffset"];
    [self.superview removeObserver:self forKeyPath:@"contentSize"];
    [oldScrollView.panGestureRecognizer removeObserver:self forKeyPath:@"state"];
    
    if (newSuperview && [newSuperview isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)newSuperview;
        self.scrollView = scrollView;
        
        [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
        [scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL];
        [scrollView.panGestureRecognizer addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
        
        self.f_x = 0;
        self.f_width = newSuperview.f_width;
    }
    
}

- (void)beginRefresh
{
    if (!self.window) {
        self.state = FRefreshStateWillRefresh;
    } else {
       self.state = FRefreshStateRefreshing;
    }
}

- (void)endRefresh
{
    self.state = FRefreshStateIdle;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewContentOffsetChanged];
    } else if ([keyPath isEqualToString:@"contentSize"]) {
        [self scrollViewContentSizeChanged];
    } else if ([keyPath isEqualToString:@"state"]) {
        [self scrollViewPanGestureStateChanged];
    }
}

- (void)scrollViewContentOffsetChanged{}
- (void)scrollViewContentSizeChanged{}
- (void)scrollViewPanGestureStateChanged{}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    _pullingPercent = pullingPercent;
    
    if (self.state == FRefreshStateRefreshing) {
        self.alpha = 1;
    } else {
        if (!self.alphaChange) {
            self.alpha = 1;
        } else {
            self.alpha = self.pullingPercent;
        }
    }
}

@end
