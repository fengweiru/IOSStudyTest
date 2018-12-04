//
//  FRefreshBackFooterView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/26.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshBackFooterView.h"

@implementation FRefreshBackFooterView

- (void)placeSubview
{
    [super placeSubview];
    
    if (self.scrollView.contentSize.height < self.scrollView.f_height) {
        self.f_y = self.scrollView.f_height;
    } else {
        self.f_y = self.scrollView.contentSize.height;
    }
    
    [self scrollViewContentSizeChanged];
}

- (void)scrollViewContentSizeChanged
{
    [super scrollViewContentSizeChanged];
    
    CGFloat yOne = self.scrollView.f_height - self.originalInset.top;
    CGFloat yTwo = self.scrollView.contentSize.height + self.originalInset.bottom;
    
    self.f_y = MAX(yOne, yTwo);
    
//    if (self.scrollView.contentSize.height < self.scrollView.f_height) {
//        self.f_y = self.scrollView.f_height - self.originalInset.top;
//    } else {
//        self.f_y = self.scrollView.contentSize.height + self.originalInset.bottom;
//    }
}

- (void)scrollViewContentOffsetChanged
{
    [super scrollViewContentOffsetChanged];
    
    CGFloat contentOffsetY = self.scrollView.f_offsetY;
    CGFloat footerOffsetY = 0.f;   //对于refreshfooter的偏移值
    if (self.f_y == self.scrollView.f_height - self.originalInset.top) {
        footerOffsetY = contentOffsetY+self.scrollView.f_insetT;
    } else {
        footerOffsetY = contentOffsetY - (self.scrollView.contentSize.height - self.scrollView.f_height + self.originalInset.bottom);
    }
//    if (self.scrollView.contentSize.height <= self.scrollView.f_height) {
//        footerOffsetY = contentOffsetY+self.scrollView.f_insetT;
//    } else {
//        footerOffsetY = contentOffsetY - (self.scrollView.contentSize.height - self.scrollView.f_height + self.originalInset.bottom);
//    }
    self.pullingPercent = footerOffsetY/self.f_height;
    
    if (self.scrollView.isDragging) {
        if (footerOffsetY >= self.f_height) {
            self.state = FRefreshStatePulling;
        } else {
            self.state = FRefreshStateIdle;
        }
    } else {
        if (self.state == FRefreshStatePulling) {
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
        CGFloat contentInsetBottom = 0.f;
        CGFloat setOffsetY = 0.f;
        if (self.f_y == self.scrollView.f_height - self.originalInset.top) {
            contentInsetBottom = self.scrollView.f_height-self.scrollView.contentSize.height+self.f_height - self.originalInset.top;
            setOffsetY = self.f_height - self.originalInset.top;
        } else {
            contentInsetBottom = self.f_height + self.originalInset.bottom;
            setOffsetY = self.scrollView.contentSize.height - self.scrollView.f_height + self.originalInset.bottom + self.f_height;
        }
        
//        if (self.scrollView.contentSize.height < self.scrollView.f_height) {
//            contentInsetBottom = self.scrollView.f_height-self.scrollView.contentSize.height+self.f_height - self.originalInset.top;
//        } else {
//            contentInsetBottom = self.f_height + self.originalInset.bottom;
//        }
        self.refreshingBlock();
        [UIView animateWithDuration:0.2f animations:^{
            self.scrollView.f_insetB = contentInsetBottom;
            self.scrollView.f_offsetY = setOffsetY;
        }];
    } else if (self.state == FRefreshStateIdle) {
        if (lastState != FRefreshStateRefreshing) {
            return;
        }
        [UIView animateWithDuration:0.4f animations:^{
            self.scrollView.f_insetB = self.originalInset.bottom;
        }];
    }
}

@end
