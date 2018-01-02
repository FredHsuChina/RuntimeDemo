//
//  ViewController.m
//  MyBlockTest
//
//  Created by 许文锋 on 2017/12/7.
//  Copyright © 2017年 中国移动. All rights reserved.
//

#import "ViewController.h"
#import "TestService.h"
#import "CATest.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "NSObject+Property.h"
#import "Person.h"


@interface ViewController ()
//@property (nonatomic,strong)  void(^SuccessBlock)(void);
//@property(nonatomic,strong) void(^FaildBlock)(void);
@end
//typedef  void(^SuccessBlock)(void);
//typedef void(^FaildBlock)(void);
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self getDataFromService:SuccessBlock returnFaild:FaildBlock];
//    [self getDataFromService:^{
//        NSLog(@"成功");
//    } faildBlock:^{
//        NSLog(@"失败");
//    }];
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [TestService getClientFromService:@"0" successBlock:^(NSString *recode) {
            NSLog(@"%@",recode);
            NSLog(@"2");
        } faildBlock:^(NSString *recode) {
            NSLog(@"%@",recode);
        }];
    });
    NSLog(@"3");
    UIButton *btn=({
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(100, 100, 60, 40);
        [btn setTitle:@"法克鱿" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        btn;
    });
    //
//    CATest *ca = [CATest new];
//    ca.str = @"hello world";
//    if ([ca respondsToSelector:@selector(uppercaseString)]) {
//        NSString  *s = [ca performSelector:@selector(uppercaseString)];
//        NSLog(@"=======%@=====",s);
   
//    Method imageNameMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
//    Method inImageNameMethod = class_getClassMethod([self class], @selector(inImageName:));
//    method_exchangeImplementations(imageNameMethod, inImageNameMethod);
    
     UIImage *image = [UIImage imageNamed:@"223"];
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"李四";
    NSLog(@"runtime动态添加属性name==%@",objc.name);
    NSArray *pictures = @[@{@"picName":@"xxx.png",@"picUrl":@"www.baidu.com"},@{@"picName":@"xxx.mp4",@"picUrl":@"www.qq.com"}];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"许文锋",@"name",@1,@"age",@"男",@"grent",@180,@"height", @{@"weight":@12,@"name":@"coco"},@"dog",pictures,@"pictures",nil];
    Person *p = [Person methodWithDict:dict];
    NSLog(@"%@---%ld---%@---%ld---dog:%@===%ld",p.name,p.age,p.grent,p.height,p.dog.name,p.dog.weight);
//    }
}

//+ (UIImage *)inImageName:(NSString*)name{
//    UIImage *image = [UIImage imageNamed:name];
//    if (image) {
//        NSLog(@"图片--%@添加成功",name);
//    }else{
//        NSLog(@"图片--%@添加失败",name);
//    }
//    return image;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)getDataFromService:(SuccessBlock)returnBlock faildBlock:(FaildBlock)faildBlock{
//    int i=3;
//    if (i==2) {
//        returnBlock();
//    }else{
//        faildBlock();
//    }
//}
@end
