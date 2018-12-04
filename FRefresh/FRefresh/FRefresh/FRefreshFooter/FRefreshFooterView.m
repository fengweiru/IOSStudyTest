//
//  FRefreshFooterView.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/26.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshFooterView.h"

@implementation FRefreshFooterView

+ (instancetype)footWithRefreshingBlock:(RefreshingBlock)block
{
    FRefreshFooterView *footer = [[self alloc] init];
    footer.refreshingBlock = block;
    return footer;
}

- (void)placeSubview
{
    [super placeSubview];
    
    self.f_height = default_height;
}

@end
