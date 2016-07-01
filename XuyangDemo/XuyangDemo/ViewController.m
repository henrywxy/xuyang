//
//  ViewController.m
//  XuyangDemo
//
//  Created by 杨闯 on 16/6/30.
//  Copyright © 2016年 王旭阳. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[RCIM sharedRCIM] initWithAppKey:@"cpj2xarljli1n"];
    
   
    
    
    
    
    
    
    
    [[RCIM sharedRCIM] connectWithToken:@"YourTestUserToken" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

 //获取token值
-(void)httpTokenRequest
{

}


//进入聊天界面
-(IBAction)tallViewController
{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
