//
//  LoadingAnimationView.m
//  Animation
//
//  Created by fengweiru on 2018/8/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "LoadingAnimationView.h"

#define firstColor    [UIColor colorWithRed:90 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1.0]
#define secondColor   [UIColor colorWithRed:250 / 255.0 green:85 / 255.0 blue:78 / 255.0 alpha:1.0]
#define thirdColor    [UIColor colorWithRed:92 / 255.0 green:201 / 255.0 blue:105 / 255.0 alpha:1.0]
#define fourthColor   [UIColor colorWithRed:253 / 255.0 green:175 / 255.0 blue:75 / 255.0 alpha:1.0]

@interface LoadingAnimationView ()
{
    CAShapeLayer *topLineLayer;
    CAShapeLayer *leftLineLayer;
    CAShapeLayer *bottomLineLayer;
    CAShapeLayer *rightLineLayer;
}

@end

@implementation LoadingAnimationView

- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(100, 200, 80, 80);
//        self.backgroundColor = [UIColor lightGrayColor];
        [self createLayer];
    }
    return self;
}

- (void)createLayer
{
    CGPoint topPoint = CGPointMake(5.f, 20.f);
    CGPoint leftPoint = CGPointMake(20.f, 75.f);
    CGPoint bottomPoint = CGPointMake(75.f, 60.f);
    CGPoint rightPoint = CGPointMake(60.f, 5.f);
    
    CGFloat lineLength = 80.f - 2*5.f;
    
    topLineLayer = [self createLineLayer:topPoint toPoint:CGPointMake(topPoint.x+lineLength, topPoint.y) withColor:firstColor];
    leftLineLayer = [self createLineLayer:leftPoint toPoint:CGPointMake(leftPoint.x, leftPoint.y-lineLength) withColor:secondColor];
    bottomLineLayer = [self createLineLayer:bottomPoint toPoint:CGPointMake(bottomPoint.x-lineLength, bottomPoint.y) withColor:thirdColor];
    rightLineLayer = [self createLineLayer:rightPoint toPoint:CGPointMake(rightPoint.x, rightPoint.y+lineLength) withColor:fourthColor];
    
    [self.layer addSublayer:topLineLayer];
    [self.layer addSublayer:leftLineLayer];
    [self.layer addSublayer:bottomLineLayer];
    [self.layer addSublayer:rightLineLayer];
    
    self.transform = CGAffineTransformMakeRotation(M_PI_4);
}

- (CAShapeLayer *)createLineLayer:(CGPoint)fromPoint toPoint:(CGPoint)touPoint withColor:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:fromPoint];
    [path addLineToPoint:touPoint];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineCap = kCALineCapRound;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = 10.f;
    layer.opacity = 0.8f;
    
    layer.path = path.CGPath;
    return layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self createAnimations];
}

- (void)createAnimations {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(M_PI*2+M_PI_4);
    anim.duration = 3.5f;
    anim.repeatDuration = 7.f;
    [self.layer addAnimation:anim forKey:nil];
    
    //让线条缩短
    [self createLineLayerAnim:topLineLayer pointX:0.f pointY:15.f];
    [self createLineLayerAnim:leftLineLayer pointX:15.f pointY:0.f];
    [self createLineLayerAnim:bottomLineLayer pointX:0.f pointY:-15.f];
    [self createLineLayerAnim:rightLineLayer pointX:-15.f pointY:0.f];
    
    //线条变长
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim1.fillMode = kCAFillModeForwards;
    anim1.removedOnCompletion = false;
    anim1.beginTime = CACurrentMediaTime() + 7.f;
    anim1.fromValue = @0;
    anim1.toValue = @1;
    anim1.duration = 3.f;
    [topLineLayer addAnimation:anim1 forKey:nil];
    [leftLineLayer addAnimation:anim1 forKey:nil];
    [bottomLineLayer addAnimation:anim1 forKey:nil];
    [rightLineLayer addAnimation:anim1 forKey:nil];
    
    CAKeyframeAnimation *anim2 =  [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim2.duration = 8.0f;
    anim2.beginTime = CACurrentMediaTime()+7.f;
    NSValue *fromValue = @1;
    NSValue *toValue = @1.2;
    
    anim2.keyTimes = @[@0.1,@0.4,@0.5];
    anim2.values = @[fromValue,toValue,fromValue];
    [self.layer addAnimation:anim2 forKey:nil];
}

- (void)createLineLayerAnim:(CAShapeLayer *)layer pointX:(CGFloat)pointx pointY:(CGFloat)pointy
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = false;
    anim.fromValue = @1;
    anim.toValue = @0;
    anim.duration = 3.f;
    [layer addAnimation:anim forKey:nil];
    
    //位移
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation animation];
    anim1.keyPath = @"transform";
    anim1.repeatDuration = 4.0f;
    anim1.beginTime = CACurrentMediaTime() + 3.f;
    anim1.duration = 1.0f;
    NSValue *fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.f, 0.f, 0.f)];
    NSValue *toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(pointx, pointy, 0.f)];
    anim1.values = @[fromValue,toValue,fromValue,toValue,fromValue];
    [layer addAnimation:anim1 forKey:nil];
}

@end
