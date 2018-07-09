//
//  SuperView.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "SuperView.h"

@implementation SuperView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.subviews.count > 0) {
        UIView *buttonView = [self.subviews firstObject];
//        CGPoint buttonPoint = [self convertPoint:point toView:buttonView];
        if (CGRectContainsPoint(buttonView.frame, point)) {
            return true;
        }
    }
    
    return [super pointInside:point withEvent:event];
}

@end
