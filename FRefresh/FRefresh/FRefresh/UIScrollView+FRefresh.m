//
//  UIScrollView+FRefresh.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "UIScrollView+FRefresh.h"
#import "FRefreshHeaderView.h"
#import "FRefreshFooterview.h"
#import <objc/runtime.h>

@implementation UIScrollView (FRefresh)

- (void)setRefreshHeaderView:(FRefreshHeaderView *)refreshHeaderView
{
    if (self.refreshHeaderView != refreshHeaderView) {
        [self.refreshHeaderView removeFromSuperview];
        
        objc_setAssociatedObject(self, @selector(refreshHeaderView), refreshHeaderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:refreshHeaderView];
    }
}

- (FRefreshHeaderView *)refreshHeaderView
{
    return objc_getAssociatedObject(self, @selector(refreshHeaderView));
}

-  (void)setRefreshFooterView:(FRefreshFooterView *)refreshFooterView
{
    if (self.refreshFooterView != refreshFooterView) {
        [self.refreshFooterView removeFromSuperview];
        
        objc_setAssociatedObject(self, @selector(refreshFooterView), refreshFooterView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:refreshFooterView];
    }
}

- (FRefreshFooterView *)refreshFooterView
{
    return objc_getAssociatedObject(self, @selector(refreshFooterView));
}

- (void)endHeadRefresh
{
    [self.refreshHeaderView endRefresh];
}

- (void)endFootRefresh
{
    [self.refreshFooterView endRefresh];
}

@end
