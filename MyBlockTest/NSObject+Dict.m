//
//  NSObject+Dict.m
//  MyBlockTest
//
//  Created by 许文锋 on 2018/1/2.
//  Copyright © 2018年 中国移动. All rights reserved.
//

#import "NSObject+Dict.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Dict)
+ (instancetype)methodWithDict:(NSDictionary *)dict{
    //创建对应的对象
    id obic = [[self alloc] init];
    /*
     class_copyIvarList:获取类中的所有成员变量
     Ivar:成员变量
     第一个参数：表示获取哪个类的成员变量
     第二个参数：表示这个类有多少成员变量，传入一个int的地址，会自动给这个变量赋值
     返回值Ivar *：指的是一个ivar数组，会把所有的成员属性放到一个数组中，通过返回的数组就能全部获取到。
     count:成员变量个数
     */
    unsigned int count = 0;
    //获取类中所有的成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    //遍历所有的成员变量
    for (int i=0; i<count; i++) {
        Ivar ivar = ivarList[i];
        //获取成员变量的名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //去掉下标 "_"
        NSString *key = [ivarName substringFromIndex:1];
        //获取变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        //替换 @\"user\"--->user
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        //从字典中根据成员变量的名字取值
        id value = dict[key];
        //判断value是否为nil，KVC的value不能为nil
//        if (value) {
//            //KVC赋值，forKeyPath比forKey好
//            [obic setValue:value forKeyPath:key];
//        }
      
        //二级转换
        if ([value isKindOfClass:[NSDictionary class]]&&![ivarType hasPrefix:@"NS"]) {
            //字典转换模型UserDict=>User模型，转换成哪个模型
            //根据字符串类名生成类对象
            Class methodClass = NSClassFromString(ivarType);
            if (methodClass) {
                value = [methodClass methodWithDict:value];
            }
        }
        //三级转换 NSArray中也是字典 ，把数组中的字典转换成模型
        //判断是否有数组
        if([value isKindOfClass:[NSArray class]]){
            //判断对应的类有没有实现字典数组转模型数组的协议
            //arrayContainModelClass提供一个协议，只要遵守这个协议的类，都能把数组中的字典转模型
            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
                id idSelf = self;//转化成id类型就能调用任何类型的方法了
                NSString *type = [idSelf arrayContainModelClass][key];
                //生成模型
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                //遍历字典数组，生成模型数组
                for (NSDictionary *dic in value) {
                    //字典转模型
                    id model = [classModel methodWithDict:dic];
                    [arrM addObject:model];
                }
                value = arrM;
            }
        }
        if (value) {
            [obic setValue:value forKeyPath:key];
        }
    }
    return obic;
}

@end
