//
//  FRefreshFooterView.h
//  FRefresh
//
//  Created by fengweiru on 2018/7/26.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "FRefreshBaseView.h"

@interface FRefreshFooterView : FRefreshBaseView

+ (instancetype)footWithRefreshingBlock:(RefreshingBlock)block;

@end
