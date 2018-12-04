//
//  FRefreshHeaderView.h
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshBaseView.h"

static NSString *FRefreshHeaderRefreshTimeKey = @"FRefreshHeader_RefreshTimeKey";

@interface FRefreshHeaderView : FRefreshBaseView

+ (instancetype)headWithRefreshingBlock:(RefreshingBlock)block;

@end
