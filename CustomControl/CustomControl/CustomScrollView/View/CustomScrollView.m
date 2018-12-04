//
//  CustomScrollView.m
//  CustomControl
//
//  Created by fengweiru on 2018/7/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "CustomScrollView.h"

@interface CustomScrollView ()<UIGestureRecognizerDelegate>


@end

@implementation CustomScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = true;
        
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        _panGesture.delegate = self;
        _panGesture.cancelsTouchesInView = false;
        [self addGestureRecognizer:_panGesture];
    }
    return self;
}

- (void)panAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGRect tmpBounds = self.bounds;
    
    CGPoint transitionPoint = [gestureRecognizer translationInView:self];
    
    CGFloat minOffset = 0.f;
    CGFloat maxOffsetX = _contentSize.width - tmpBounds.size.width;
    CGFloat maxOffsetY = _contentSize.height - tmpBounds.size.height;
    CGFloat actualOffsetX = fmax(minOffset, fmin(maxOffsetX, (tmpBounds.origin.x - transitionPoint.x)));
    CGFloat actualOffsetY = fmax(minOffset, fmin(maxOffsetY, (tmpBounds.origin.y - transitionPoint.y)));

    tmpBounds.origin.x = actualOffsetX;
    tmpBounds.origin.y = actualOffsetY;
    
    [gestureRecognizer setTranslation:CGPointZero inView:self];
    self.bounds = tmpBounds;
    
}


@end
