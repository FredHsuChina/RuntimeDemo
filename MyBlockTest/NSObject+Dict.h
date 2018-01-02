//
//  NSObject+Dict.h
//  MyBlockTest
//
//  Created by 许文锋 on 2018/1/2.
//  Copyright © 2018年 中国移动. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ObjectDelegate<NSObject>
@optional
+ (NSDictionary *)arrayContainModelClass;
@end
@interface NSObject (Dict)
+ (instancetype)methodWithDict:(NSDictionary *)dict;
@end
