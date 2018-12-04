//
//  TestFunctionOne+testCategory.m
//  runtimeTest
//
//  Created by fengweiru on 2018/9/5.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "TestFunctionOne+testCategory.h"
#import <objc/runtime.h>

@implementation TestFunctionOne (testCategory)

+ (void)load
{
    [self changeMehtod];
}

+ (void)changeMehtod {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    Method method = class_getInstanceMethod(object_getClass(dict), @selector(setObject:forKey:));
    
    void (*originIMP)(id self, SEL _cmd, id anobject, id akey) = nil;
    originIMP = method_getImplementation(method);
    
    id handleSetObject = ^(id self, id anobject, id akey) {
        if (anobject == nil) {
            anobject = @"error";
        }
        originIMP(self, _cmd, anobject, akey);
    };
    
    IMP newIMP = imp_implementationWithBlock(handleSetObject);
    method_setImplementation(method, newIMP);
}

- (void)hello
{
    NSLog(@"category中hello方法调用");
}

@end
