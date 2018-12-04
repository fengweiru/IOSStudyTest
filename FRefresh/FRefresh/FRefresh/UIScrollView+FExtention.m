//
//  UIScrollView+FExtention.m
//  FRefresh
//
//  Created by fengweiru on 2018/8/3.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "UIScrollView+FExtention.h"

@implementation UIScrollView (FExtention)

- (UIEdgeInsets)f_inset
{
    UIEdgeInsets inset = self.contentInset;
    
    if (@available(iOS 11, *)) {
        inset = self.adjustedContentInset;
    }
    
    return inset;
}

- (void)setF_insetT:(CGFloat)f_insetT
{
    UIEdgeInsets inset = self.contentInset;
    
    if (@available(iOS 11, *)) {
        inset.top = f_insetT - self.safeAreaInsets.top;
    } else {
        inset.top = f_insetT;
    }
    
    self.contentInset = inset;
}

- (CGFloat)f_insetT
{
    return self.f_inset.top;
}

- (void)setF_insetB:(CGFloat)f_insetB
{
    UIEdgeInsets inset = self.contentInset;
    
    if (@available(iOS 11, *)) {
        inset.bottom = f_insetB - self.safeAreaInsets.bottom;
    } else {
        inset.bottom = f_insetB;
    }
    
    self.contentInset = inset;
}

- (CGFloat)f_insetB
{
    return self.f_inset.bottom;
}

- (void)setF_insetL:(CGFloat)f_insetL
{
    UIEdgeInsets inset = self.contentInset;
    
    if (@available(iOS 11, *)) {
        inset.left = f_insetL - self.safeAreaInsets.left;
    } else {
        inset.left = f_insetL;
    }
    
    self.contentInset = inset;
}

- (CGFloat)f_insetL
{
    return self.f_inset.left;
}

- (void)setF_insetR:(CGFloat)f_insetR
{
    UIEdgeInsets inset = self.contentInset;
    
    if (@available(iOS 11, *)) {
        inset.right = f_insetR - self.safeAreaInsets.right;
    } else {
        inset.right = f_insetR;
    }
    
    self.contentInset = inset;
}

- (CGFloat)f_insetR
{
    return self.f_inset.right;
}

- (void)setF_offsetX:(CGFloat)f_offsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = f_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)f_offsetX
{
    return self.contentOffset.x;
}

- (void)setF_offsetY:(CGFloat)f_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = f_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)f_offsetY
{
    return self.contentOffset.y;
}

- (void)setF_contentW:(CGFloat)f_contentW
{
    CGSize size = self.contentSize;
    size.width = f_contentW;
    self.contentSize = size;
}

- (CGFloat)f_contentW
{
    return self.contentSize.width;
}

- (void)setF_contentH:(CGFloat)f_contentH
{
    CGSize size = self.contentSize;
    size.height = f_contentH;
    self.contentSize = size;
}

- (CGFloat)f_contentH
{
    return self.contentSize.height;
}

@end
