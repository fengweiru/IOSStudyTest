//
//  UIView+FWRFrame.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "UIView+FWRFrame.h"

@implementation UIView (FWRFrame)

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)fwrH
{
    return self.frame.size.height;
}

- (void)setFwrH:(CGFloat)fwrH
{
    CGRect frame = self.frame;
    frame.size.height = fwrH;
    self.frame = frame;
}

- (CGFloat)fwrW
{
    return self.frame.size.width;
}

- (void)setFwrW:(CGFloat)fwrW
{
    CGRect frame = self.frame;
    frame.size.width = fwrW;
    self.frame = frame;
}

- (CGSize)fwrSize
{
    return self.frame.size;
}

- (void)setFwrSize:(CGSize)fwrSize
{
    CGRect frame = self.frame;
    frame.size = fwrSize;
    self.frame = frame;
}

- (CGPoint)fwrOrigin
{
    return self.frame.origin;
}

- (void)setFwrOrigin:(CGPoint)fwrOrigin
{
    CGRect frame = self.frame;
    frame.origin = fwrOrigin;
    self.frame = frame;
}


@end
