//
//  NSString+UUID.m
//  NewBasicFrameWork
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//
#import "NSString+UUID.h"

@implementation NSString (UUID)
+ (NSString *)UUID
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    return (__bridge_transfer NSString *)uuid;
}
@end
