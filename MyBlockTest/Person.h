//
//  Person.h
//  MyBlockTest
//
//  Created by 许文锋 on 2018/1/2.
//  Copyright © 2018年 中国移动. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "NSObject+Dict.h"

@interface Person : NSObject<ObjectDelegate>
@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,strong) NSString *grent;
@property(nonatomic,assign) NSInteger height;
@property(nonatomic,strong) Dog *dog;
@property(nonatomic,strong) NSArray *pictures;
@end
