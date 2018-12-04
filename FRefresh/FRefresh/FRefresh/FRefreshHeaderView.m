//
//  FRefreshHeaderView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshHeaderView.h"

@implementation FRefreshHeaderView

+ (instancetype)headWithRefreshingBlock:(RefreshingBlock)block
{
    FRefreshHeaderView *header = [[self alloc] init];
    header.refreshingBlock = block;
    return header;
}

- (void)placeSubview
{
    [super placeSubview];
    
    self.f_height = default_height;
    self.f_y = -self.f_height;
    
    [self scrollViewContentOffsetChanged];
}

- (void)scrollViewContentOffsetChanged
{
    [super scrollViewContentOffsetChanged];
    
    CGFloat contentOffsetY = self.scrollView.f_offsetY+self.originalInset.top;
    CGFloat headerOffsetY = -contentOffsetY;
    
    self.pullingPercent = headerOffsetY/self.f_height;
    
    if (self.scrollView.dragging) {
        
        if (headerOffsetY >= self.f_height) {
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
        self.refreshingBlock();
        [UIView animateWithDuration:0.2f animations:^{
            self.scrollView.f_insetT = self.f_height + self.originalInset.top;
            self.scrollView.f_offsetY = -(self.f_height + self.originalInset.top);
        }];
    } else if (self.state == FRefreshStateIdle) {
        if (lastState != FRefreshStateRefreshing) {
            return;
        }
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:FRefreshHeaderRefreshTimeKey];
        [UIView animateWithDuration:0.4f animations:^{
            self.scrollView.f_insetT = self.originalInset.top;
        }];
    }
}

@end
