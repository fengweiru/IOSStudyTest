//
//  FRefreshStateHeaderView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshStateHeaderView.h"

@implementation FRefreshStateHeaderView

- (void)prepare
{
    [super prepare];
    
    [self addSubview:self.stateLabel];
    [self addSubview:self.timeLabel];
}

- (void)placeSubview
{
    [super placeSubview];
    
    self.stateLabel.frame = CGRectMake(0, 0, self.f_width, self.f_height/2);
    self.timeLabel.frame = CGRectMake(0, self.f_height/2, self.f_width, self.f_height/2);
}

- (void)setState:(FRefreshState)state
{
    [super setState:state];
    
    if (state == FRefreshStateIdle) {
        self.stateLabel.text = @"下拉进行刷新";
        self.timeLabel.text = [self lastUpdateTimeString];
    } else if (state == FRefreshStatePulling) {
        self.stateLabel.text = @"松开即将刷新";
    } else if (state == FRefreshStateRefreshing) {
        self.stateLabel.text = @"正在刷新...";
    }
}

- (NSString *)lastUpdateTimeString
{
    NSDate *lastRefreshDate = [[NSUserDefaults standardUserDefaults] objectForKey:FRefreshHeaderRefreshTimeKey];
    if (!lastRefreshDate) {
        return @"无刷新记录";
    }
    
    return [NSString stringWithFormat:@"上次刷洗时间：%@",lastRefreshDate.description];
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.text = @"下拉刷新";
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.textColor = [UIColor whiteColor];
    }
    return _stateLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"无刷新记录";
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = [UIColor whiteColor];
    }
    return _timeLabel;
}

@end
