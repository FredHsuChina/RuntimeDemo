//
//  CATest.m
//  MyBlockTest
//
//  Created by 许文锋 on 2017/12/25.
//  Copyright © 2017年 中国移动. All rights reserved.
//

#import "CATest.h"
#import <objc/runtime.h>

IMP originIMP;
@implementation CATest

//消息转发
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(uppercaseString)) {
//        return _str;
//    }
//    return @"";
//}
- (instancetype)init{
    self = [super init];
    Class strcls = [self class];
    SEL  oriUppercaseString = @selector(uppercaseString);
    originIMP = [NSString instanceMethodForSelector:oriUppercaseString];
   BOOL addResult = class_addMethod(strcls, oriUppercaseString, originIMP, NULL);
    if (addResult) {
        self.str = [_str uppercaseString];
    }
    return self;
}
@end
