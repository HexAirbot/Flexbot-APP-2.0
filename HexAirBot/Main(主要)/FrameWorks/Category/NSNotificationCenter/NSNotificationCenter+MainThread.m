//
//  NSNotificationCenter+MainThread.m
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "NSNotificationCenter+MainThread.h"

@implementation NSNotificationCenter (MainThread)
- (void)postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName abject:(id)anObject
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self postNotificationOnMainThread:notification];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName abject:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotificationOnMainThread:notification];
}

@end
