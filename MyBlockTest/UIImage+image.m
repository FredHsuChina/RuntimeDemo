//
//  UIImage+image.m
//  MyBlockTest
//
//  Created by 许文锋 on 2018/1/2.
//  Copyright © 2018年 中国移动. All rights reserved.
//

#import "UIImage+image.h"
#import <objc/runtime.h>

@implementation UIImage (image)
+ (void)load{
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method in_imageNameMethod = class_getClassMethod(self, @selector(in_imageName:));
    method_exchangeImplementations(imageNameMethod, in_imageNameMethod);
}

+ (UIImage *)in_imageName:(NSString *)name{
    UIImage *image = [UIImage in_imageName:name];
    if (image) {
        NSLog(@"图片%@---加载成功",name);
    }else{
        NSLog(@"图片%@---加载失败",name);
    }
    return image;
}
@end
