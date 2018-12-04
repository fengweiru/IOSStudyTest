//
//  FRefreshBaseView.h
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FFrame.h"
#import "UIScrollView+FExtention.h"

static CGFloat default_height = 50.f;

typedef void(^RefreshingBlock)(void);
typedef NS_ENUM(NSInteger, FRefreshState) {
    FRefreshStateIdle = 1,        //闲置状态
    FRefreshStatePulling,         //拉动状态
    FRefreshStateRefreshing,      //刷新状态
    FRefreshStateNoMoreData,      //没有更多数据状态
    FRefreshStateWillRefresh      //即将刷新状态
};

@interface FRefreshBaseView : UIView

@property (nonatomic, strong) RefreshingBlock refreshingBlock;
@property (nonatomic, assign) FRefreshState state;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat pullingPercent;
@property (nonatomic, assign) UIEdgeInsets originalInset;

//滑动时是否改变透明度，默认是
@property (nonatomic, assign) BOOL alphaChange;

- (void)prepare;
- (void)placeSubview;
- (void)scrollViewContentOffsetChanged;
- (void)scrollViewContentSizeChanged;
- (void)scrollViewPanGestureStateChanged;
- (void)beginRefresh;
- (void)endRefresh;

@end
