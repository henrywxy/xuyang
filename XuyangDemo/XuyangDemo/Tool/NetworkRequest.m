//
//  NetworkRequest.m
//  TDJR
//
//  Created by KCB on 16/1/14.
//  Copyright © 2016年 TDJR. All rights reserved.
//

#import "NetworkRequest.h"
#import "AFNetworking.h"
@implementation NetworkRequest


#pragma mark - GET请求
/** GET请求 */
+ (void)GetNetworkRequestWithURLString:(NSString *)urlString successBlock:(void(^)(NSDictionary *dict))successBlock failBlock:(void(^)(NSError *error))failBlcok {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 10;
    //取出用户ID判断是否登录
//    NSString *userId = ReadForLocation(@"USERID");
//    if (!ReadForLocation(@"USERID")) {
//        
//        userId = @"0";
//    }
//    NSString *UserSessionId = ReadForLocation(@"UserSessionId");
//    if (!ReadForLocation(@"UserSessionId")) {
//        
//        UserSessionId = @"0";
//    }
//    
//    [manager.requestSerializer setValue:userId forHTTPHeaderField:@"userId"];
//    [manager.requestSerializer setValue:UserSessionId forHTTPHeaderField:@"userSessionId"];
//    [manager.requestSerializer setValue:[CommandHelp returnSecond] forHTTPHeaderField:@"time"];
//    [manager.requestSerializer setValue:[CommandHelp getUniqueStrByUUID] forHTTPHeaderField:@"imei"];
    
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    NSString * uuidString = (__bridge_transfer NSString *)string;
     [manager.requestSerializer setValue:uuidString forHTTPHeaderField:@"imei"];
    
     NSString *encodingString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:encodingString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //请求成功
        successBlock(dictionary);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        failBlcok(error);
    }];
    
}


#pragma mark - POST请求
/** POST请求 */
+ (void)PostNetwrokRequestWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters successBlock:(void(^)(NSDictionary *dict))successBlock failBlock:(void(^)(NSError *error))failBlcok {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 10;
    //取出用户ID判断是否登录
//    NSString *userId = ReadForLocation(@"USERID");
//    if (!ReadForLocation(@"USERID")) {
//        
//        userId = @"0";
//    }
//    NSString *UserSessionId = ReadForLocation(@"UserSessionId");
//    if (!ReadForLocation(@"UserSessionId")) {
//        
//        UserSessionId = @"0";       
//    }
//    
//    [manager.requestSerializer setValue:userId forHTTPHeaderField:@"userId"];
//    [manager.requestSerializer setValue:UserSessionId forHTTPHeaderField:@"userSessionId"];
//    [manager.requestSerializer setValue:[CommandHelp returnSecond] forHTTPHeaderField:@"time"];
//    [manager.requestSerializer setValue:[CommandHelp getUniqueStrByUUID] forHTTPHeaderField:@"imei"];
//


    NSString *encodingString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:encodingString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //请求成功
        successBlock(dictionary);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        failBlcok(error);
        
    }];

}

@end
