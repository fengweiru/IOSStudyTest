//
//  PanGestureOne.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "PanGestureOne.h"

@implementation PanGestureOne

- (instancetype)initWithTarget:(id)target action:(SEL)action
{
    if (self = [super initWithTarget:target action:action]) {
        self.delegate = self;
    }
    return self;
}

////共存  A手势或者B手势 代理方法里shouldRecognizeSimultaneouslyWithGestureRecognizer   有一个是返回YES，就能共存
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//
//    return YES;
//
//}


////让自身这个手势事件响应优先级低于其它手势事件
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer  {
//
//    return YES;
//
//}

@end
