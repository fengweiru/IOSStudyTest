//
//  FRefreshAutoFooterView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/26.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshAutoFooterView.h"

@implementation FRefreshAutoFooterView

- (void)prepare
{
    [super prepare];
    
    self.alpha = 1.f;
    self.alphaChange = false;
}

- (void)placeSubview
{
    [super placeSubview];
    
    self.f_y = self.scrollView.contentSize.height;
//    if (self.scrollView.contentSize.height >= self.scrollView.f_height) {
//        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, self.f_height, 0);
//    } else {
//        self.scrollView.contentInset = UIEdgeInsetsZero;
//    }
}

- (void)scrollViewContentSizeChanged
{
    [super scrollViewContentSizeChanged];
    
    self.f_y = self.scrollView.contentSize.height;
//    if (self.scrollView.contentSize.height >= self.scrollView.f_height) {
//        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, self.f_height, 0);
//    } else {
//        self.scrollView.contentInset = UIEdgeInsetsZero;
//    }
}

- (void)scrollViewContentOffsetChanged
{
    [super scrollViewContentOffsetChanged];
    
    CGFloat contentOffsetY = self.scrollView.contentOffset.y;
    CGFloat footerOffsetY = 0.f;    //对于refreshfooter的偏移值
    CGFloat pullingPercent = 0.f;
    if (self.scrollView.contentSize.height >= self.scrollView.f_height) {
        footerOffsetY = contentOffsetY - (self.scrollView.contentSize.height - self.scrollView.f_height);
        pullingPercent = footerOffsetY/self.f_height;
        
        if (footerOffsetY >= self.f_height) {
            self.state = FRefreshStateRefreshing;
        }
        self.pullingPercent = pullingPercent;
    }
    
}

- (void)scrollViewPanGestureStateChanged
{
    [super scrollViewPanGestureStateChanged];
    
    if (self.scrollView.contentSize.height < self.scrollView.f_height) {
        CGPoint translationPoint = [self.scrollView.panGestureRecognizer translationInView:self.scrollView];
        if (translationPoint.y < 0 && self.scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
            self.state = FRefreshStateRefreshing;
        }
    }
}

- (void)setState:(FRefreshState)state
{
    FRefreshState lastState = self.state;
    [super setState:state];
    
    if (lastState == state) {
        return;
    }
    
    if (self.state == FRefreshStateRefreshing) {
        self.refreshingBlock();
    } else if (self.state == FRefreshStateIdle) {
        if (lastState != FRefreshStateRefreshing) {
            return;
        }

    }
}

@end
