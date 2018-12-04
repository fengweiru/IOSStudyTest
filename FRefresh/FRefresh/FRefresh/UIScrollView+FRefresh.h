//
//  UIScrollView+FRefresh.h
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FRefreshHeaderView;
@class FRefreshFooterView;
@interface UIScrollView (FRefresh)

@property (nonatomic, strong) FRefreshHeaderView *refreshHeaderView;
@property (nonatomic, strong) FRefreshFooterView *refreshFooterView;

- (void)endHeadRefresh;
- (void)endFootRefresh;

@end
