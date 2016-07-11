//
//  NSNotificationCenter+MainThread.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MainThread)
- (void)postNotificationOnMainThread:(NSNotification *)notification;
- (void)postNotificationOnMainThreadName:(NSString *)aName abject:(id)anObject;
- (void)postNotificationOnMainThreadName:(NSString *)aName abject:(id)anObject userInfo:(NSDictionary *)aUserInfo;
@end
