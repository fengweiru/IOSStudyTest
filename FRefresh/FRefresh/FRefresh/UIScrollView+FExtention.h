//
//  UIScrollView+FExtention.h
//  FRefresh
//
//  Created by fengweiru on 2018/8/3.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (FExtention)

@property (nonatomic, readonly) UIEdgeInsets f_inset;

@property (nonatomic, assign) CGFloat f_insetT;
@property (nonatomic, assign) CGFloat f_insetB;
@property (nonatomic, assign) CGFloat f_insetL;
@property (nonatomic, assign) CGFloat f_insetR;

@property (nonatomic, assign) CGFloat f_offsetX;
@property (nonatomic, assign) CGFloat f_offsetY;

@property (nonatomic, assign) CGFloat f_contentW;
@property (nonatomic, assign) CGFloat f_contentH;

@end
