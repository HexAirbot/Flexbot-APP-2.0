//
//  NSTimer+Blocks.m
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer (Blocks)

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(hzkExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(hzkExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (void)hzkExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if ([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
