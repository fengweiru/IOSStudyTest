//
//  UIView+FFrame.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "UIView+FFrame.h"

@implementation UIView (FFrame)

- (CGFloat)f_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)f_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)f_x
{
    return self.frame.origin.x;
}

- (void)setF_x:(CGFloat)f_x
{
    CGRect frame = self.frame;
    frame.origin.x = f_x;
    self.frame = frame;
}

- (CGFloat)f_y
{
    return self.frame.origin.y;
}

- (void)setF_y:(CGFloat)f_y
{
    CGRect frame = self.frame;
    frame.origin.y = f_y;
    self.frame = frame;
}

- (CGFloat)f_height
{
    return self.frame.size.height;
}

- (void)setF_height:(CGFloat)f_height
{
    CGRect frame = self.frame;
    frame.size.height = f_height;
    self.frame = frame;
}

- (CGFloat)f_width
{
    return self.frame.size.width;
}

- (void)setF_width:(CGFloat)f_width
{
    CGRect frame = self.frame;
    frame.size.width = f_width;
    self.frame = frame;
}

- (CGSize)f_size
{
    return self.frame.size;
}

- (void)setF_size:(CGSize)f_size
{
    CGRect frame = self.frame;
    frame.size = f_size;
    self.frame = frame;
}

- (CGPoint)f_origin
{
    return self.frame.origin;
}

- (void)setF_origin:(CGPoint)f_origin
{
    CGRect frame = self.frame;
    frame.origin = f_origin;
    self.frame = frame;
}


@end
