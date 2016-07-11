//
//  AppDelegate.m
//  HexAirBot
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import <AVOSCloud/AVOSCloud.h>
//#import <BugHD/BugHD.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WeiboSDK.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [ShareSDK registerApp:@"" activePlatforms:@[@(SSDKPlatformTypeSinaWeibo),@(SSDKPlatformTypeFacebook),@(SSDKPlatformTypeTwitter),@(SSDKPlatformTypeWechat)] onImport:^(SSDKPlatformType platformType) {

        
    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
        
        switch (platformType) {
            case SSDKPlatformTypeSinaWeibo:
                [appInfo SSDKSetupSinaWeiboByAppKey:@"" appSecret:@"" redirectUri:@"http://www.sharesdk.cn" authType:SSDKAuthTypeBoth];
                break;
            case SSDKPlatformTypeFacebook:
                [appInfo SSDKSetupFacebookByApiKey:@"" appSecret:@"" authType:SSDKAuthTypeBoth];
                break;
            case SSDKPlatformTypeTwitter:
                [appInfo SSDKSetupTwitterByConsumerKey:@"" consumerSecret:@"" redirectUri:@"http://www.sharesdk.cn"];
                break;
            case SSDKPlatformTypeWechat:
                [appInfo SSDKSetupWeChatByAppId:@"" appSecret:@""];
                break;
                
            default:
                break;
        }
    }];

    
    [self enterVC];
    
//    [BugHD handleCrashWithKey:@"bc22800dc6882faa0060796f80fa8193"];
    
    
//    [AVOSCloud setApplicationId:@"" clientKey:@""];
    [AVOSCloud setApplicationId:@"" clientKey:@""];
//    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];//统计应该的打开情况
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)enterVC
{
    TabBarController *VC = [[TabBarController alloc] init];
    VC.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = VC;
    
}


@end
