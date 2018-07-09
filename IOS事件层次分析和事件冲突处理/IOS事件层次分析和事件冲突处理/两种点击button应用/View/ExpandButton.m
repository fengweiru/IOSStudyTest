//
//  ExpandButton.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "ExpandButton.h"

@implementation ExpandButton

//按钮点击范围上左下右各增加25
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
//{
//    CGRect frame = self.bounds;
//    frame.origin.x -= 25;
//    frame.origin.y -= 25;
//    frame.size.width += 50;
//    frame.size.height += 50;
//    
//    if (CGRectContainsPoint(frame, point)) {
//        return true;
//    }
//    
//    return [super pointInside:point withEvent:event];
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect frame = self.bounds;
    frame.origin.x -= 25;
    frame.origin.y -= 25;
    frame.size.width += 50;
    frame.size.height += 50;
    
    if (CGRectContainsPoint(frame, point)) {
        return self;
    }
    
    return [super hitTest:point withEvent:event];
}

@end
