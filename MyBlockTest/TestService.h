//
//  TestService.h
//  MyBlockTest
//
//  Created by 许文锋 on 2017/12/7.
//  Copyright © 2017年 中国移动. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlock)(NSString* );
typedef void(^FaildBlock)(NSString* );
@interface TestService : NSObject
@property(nonatomic,copy) SuccessBlock sBlock;
@property(nonatomic,copy) FaildBlock fBlock;
+ (void)getClientFromService:(NSString *)flag successBlock:(SuccessBlock)successBlock faildBlock:(FaildBlock)faildBlock;
@end
