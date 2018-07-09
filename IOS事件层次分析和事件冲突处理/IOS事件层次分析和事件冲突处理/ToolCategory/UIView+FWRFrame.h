//
//  UIView+FWRFrame.h
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FWRFrame)

- (CGFloat)right;
- (CGFloat)bottom;

@property (nonatomic, assign) CGFloat fwrW;
@property (nonatomic, assign) CGFloat fwrH;
@property (nonatomic, assign) CGSize  fwrSize;
@property (nonatomic, assign) CGPoint fwrOrigin;

@end
