//
//  TestView.m
//  IOS事件层次分析和事件冲突处理
//
//  Created by fengweiru on 2018/7/9.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = color;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@ pointInside", self.description);
    
    return [super pointInside:point withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@ %s", self.description, __func__);
    
    return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchBegan", self.description);
    [super touchesBegan:touches withEvent:event];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesMoved", self.description);
    [super touchesMoved:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesEnded", self.description);
    [super touchesEnded:touches withEvent:event];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ touchesCancelled", self.description);
    [super touchesCancelled:touches withEvent:event];
    
}

- (NSString *)description
{
    if (self.backgroundColor == [UIColor whiteColor]) {
        return @"whiteView";
    } else if (self.backgroundColor == [UIColor yellowColor]) {
        return @"yellowView";
    } else if (self.backgroundColor == [UIColor grayColor]) {
        return @"grayView";
    } else if (self.backgroundColor == [UIColor redColor]) {
        return @"redView";
    } else if (self.backgroundColor == [UIColor blueColor]) {
        return @"blueView";
    } else {
        return @"noneView";
    }
}

@end
