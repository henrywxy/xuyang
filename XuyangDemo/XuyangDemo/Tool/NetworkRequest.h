//
//  NetworkRequest.h
//  TDJR
//
//  Created by KCB on 16/1/14.
//  Copyright © 2016年 TDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkRequest : NSObject


/** GET请求 */
+ (void)GetNetworkRequestWithURLString:(NSString *)urlString successBlock:(void(^)(NSDictionary *dict))successBlock failBlock:(void(^)(NSError *error))failBlcok;

/** POST请求 */
+ (void)PostNetwrokRequestWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters successBlock:(void(^)(NSDictionary *dict))successBlock failBlock:(void(^)(NSError *error))failBlcok;


@end
