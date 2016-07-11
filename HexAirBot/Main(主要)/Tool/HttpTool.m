//
//  HttpTool.m
//  BasicFrame
//
//  Created by han on 15/7/2.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "HttpTool.h"

#import "AFNetworking.h"
#import "JSONKit.h"

@implementation HttpTool

#pragma mark- 发送一个GET请求
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
//     NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",basisURL,url,access_token];
//    NSLog(@"url = %@",urlStr);
    NSString *jsonStr = [params JSONString];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:jsonStr,@"json" ,nil];
    
    //1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //2.发送Get请求
    [mgr GET:url parameters:dic success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj)
     {
         if (success)
         {
             success(responseObj);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (failure)
         {
             failure(error);
         }
     }];
}

#pragma mark- 发送一个POST请求
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",basisURL,url,access_token];
    
    //拼接字符串
    NSString *jsonStr = [params JSONString];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:jsonStr,@"json" ,nil];
    
     NSLog(@"params:%@  ,  url %@ ",dic, urlStr);
    
    
    //1.获得请求管理者
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //2.发送Post请求
    [mgr POST:urlStr parameters:dic success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObj)
     {
         NSLog(@"resultDate %@", responseObj);
         if (success)
         {
             success(responseObj);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (failure)
         {
             failure(error);
         }
     }];
}

#pragma mark- 监控网络状态
+ (void)setNetworkStatusChangeBlock:(void (^)(HZKNetworkStatus status))block
{
    //监控网络状态
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    //当网络状态改变的时候，就会调用
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
    {
        if (block)
        {
            switch (status)
            {
                case AFNetworkReachabilityStatusUnknown://未知网络
                    block(HZKNetworkStatusUnknown);
                    NSLog(@"网络异常，请检查网络设置！");
                    break;
                case AFNetworkReachabilityStatusNotReachable://没有网络
                    block(HZKNetworkStatusNotReachable);
                    NSLog(@"网络异常，请检查网络设置！");
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN://手机自带网络
                    block(HZKNetworkStatusReachableViaWWAN);
                    NSLog(@"手机自带网络");
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi://WIFI
                    block(HZKNetworkStatusReachableViaWiFi);
                    NSLog(@"WIFI");
                    break;
                    
                default:
                    break;
            }
        }
    }];
    //开始监控
    [mgr startMonitoring];
}



@end
