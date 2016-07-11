//
//  HttpTool.h
//  BasicFrame
//
//  Created by han on 15/7/2.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//
//  网络请求工具类，负责整个项目中所有的Http网络请求

#import <Foundation/Foundation.h>

#define basisURL @"https://api.thingiverse.com/"
#define access_token @"?access_token=25899b66af98df2592d5df0d8e1f88d6"

//图片路径
//http://112.124.52.129:9990/wind_home/ +返回src

typedef enum{
    HZKNetworkStatusUnknown          = -1,//未知网络
    HZKNetworkStatusNotReachable     = 0,//没有网络
    HZKNetworkStatusReachableViaWWAN = 1,//手机自带网络
    HZKNetworkStatusReachableViaWiFi = 2,//WIFI
}HZKNetworkStatus;


@interface HttpTool : NSObject

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;


/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

/**
 *  监控网络状态
 */
+ (void)setNetworkStatusChangeBlock:(void (^)(HZKNetworkStatus status))block;



@end
