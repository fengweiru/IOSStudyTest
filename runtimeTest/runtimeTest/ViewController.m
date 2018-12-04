//
//  ViewController.m
//  runtimeTest
//
//  Created by fengweiru on 2018/9/3.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "ViewController.h"
#import "TestFunctionOne.h"
#import "TestFunctionTwo.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

typedef int (^CompareBlock)(int value1, int value2);

int minInArrMethodStyle(int *array, int count, CompareBlock block) {
    if (count == 1) return array[0];
    int min = minInArrMethodStyle(array, count-1, block);
    return block(min, array[count - 1]);
}

CompareBlock relative(CompareBlock block) {
    CompareBlock newBlock = ^(int value1 ,int value2) {
        return block(value1,value2) == value1 ? value2 : value1;
    };
    return newBlock;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSDictionary *dict = [NSDictionary new];
//    NSMutableDictionary *mdict = [NSMutableDictionary new];
//    NSLog(@"dict:%@\nmdict:%@",NSStringFromClass(object_getClass(dict)),NSStringFromClass(object_getClass(mdict)));
    
//    NSArray *arr = [NSArray new];
//    NSMutableArray *marr = [NSMutableArray new];
//    NSLog(@"arr:%@\nmarr:%@",NSStringFromClass([NSArray class]),NSStringFromClass([NSMutableArray class]));
    
//    int outCount;
//    Method *methods = class_copyMethodList([TestFunctionOne class], &outCount);
//    for (int i = 0; i < outCount; i++) {
//        Method method = methods[i];
//        NSLog(@"%s",sel_getName(method_getName(method)));
//    }
//
//    [[TestFunctionOne new] hello];
    
    int array[7] = {5,4,3,1,8,6,7};
    
    CompareBlock block = ^(int value1, int value2) {
        return value1 < value2 ? value1:value2;
    };
    
    NSLog(@"min:%d",minInArrMethodStyle(array, 7, block));
    NSLog(@"max:%d",minInArrMethodStyle(array, 7, relative(block)));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    [dict setObject:nil forKey:@"1"];

//    NSLog(@"%@",dict);
//    [self isaClass];
//    [self SELTest];
}

- (void)isaClass{
    
    TestFunctionOne *objectOne = [[TestFunctionOne alloc] init];
    
    NSLog(@"1:%@, %p", object_getClass(objectOne), object_getClass(objectOne));
    
    NSLog(@"2:%@, %p", object_getClass(object_getClass(objectOne)), object_getClass(object_getClass(objectOne))); // 元类 （类本身）
    NSLog(@"元类:%@, %p", objc_getMetaClass("TestFunctionOne"), objc_getMetaClass("TestFunctionOne"));
    
    NSLog(@"元类2:%@, %p", object_getClass(object_getClass(object_getClass(objectOne))), object_getClass(object_getClass(object_getClass(objectOne))));
    
    NSLog(@"元类3:%@, %p", object_getClass(object_getClass(object_getClass(object_getClass(objectOne)))), object_getClass(object_getClass(object_getClass(object_getClass(objectOne)))));
    
    NSLog(@"NSObject元类的父类:%@, %p",class_getSuperclass(object_getClass(object_getClass(object_getClass(objectOne)))),class_getSuperclass(object_getClass(object_getClass(object_getClass(objectOne)))));
    NSLog(@"NSObject类:%@, %p",[NSObject class]);
    
    NSLog(@"父类===%@", class_getSuperclass([NSObject class]));
    
}

- (void)SELTest
{
    SEL methodId = @selector(hello:number:height:);
    NSLog(@"%s",methodId);
}

@end
