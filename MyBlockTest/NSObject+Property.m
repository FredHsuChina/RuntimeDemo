//
//  NSObject+Property.m
//  MyBlockTest
//
//  Created by 许文锋 on 2018/1/2.
//  Copyright © 2018年 中国移动. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)
- (void)setName:(NSString *)name{
    //将某个值跟某个对象关联起来,将某个值存储在某个对象之中
    //键name这个属性用name绑定关联到NSObject这个对象,
    //OBJC_ASSOCIATION_RETAIN_NONATOMIC 绑定策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    self.name = name;
}
- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
//    return self.name;
}
@end
