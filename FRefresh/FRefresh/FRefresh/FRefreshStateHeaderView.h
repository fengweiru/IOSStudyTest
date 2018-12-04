//
//  FRefreshStateHeaderView.h
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshHeaderView.h"

@interface FRefreshStateHeaderView : FRefreshHeaderView

@property (nonatomic, strong) NSDate *lastRefreshTime;

@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end
