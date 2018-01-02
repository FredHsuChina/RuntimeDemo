//
//  TestService.m
//  MyBlockTest
//
//  Created by 许文锋 on 2017/12/7.
//  Copyright © 2017年 中国移动. All rights reserved.
//

#import "TestService.h"
#import <AFNetworking/AFNetworking.h>
@implementation TestService

+ (void)getClientFromService:flag successBlock:(SuccessBlock)successBlock faildBlock:(FaildBlock)faildBlock{
    if([flag isEqualToString:@"0"]){
        successBlock(@"成功");
       
    }else{
        faildBlock(@"错误");
    }
}

@end
