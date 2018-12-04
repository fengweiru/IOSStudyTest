//
//  CustomScrollView.h
//  CustomControl
//
//  Created by fengweiru on 2018/7/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIView

@property (nonatomic, assign)CGSize contentSize;
@property (nonatomic, strong)UIPanGestureRecognizer *panGesture;

@end
