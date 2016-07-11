//
//  NSTimer+Addition.m
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)
- (void)pauseTimer
{
    if (![self isValid])
    {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer
{
    if (![self isValid])
    {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid])
    {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
