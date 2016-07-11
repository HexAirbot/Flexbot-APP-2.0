//
//  NSTimer+Blocks.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 不用scheduled方式初始化的，需要手动addTimer:forMode: 将timer添加到一个runloop中。
 　　而scheduled的初始化方法将以默认mode直接添加到当前的runloop中.
 */
@interface NSTimer (Blocks)
/**
 *  设置一个timer，默认加到runloop中
 *
 *  @param inTimeInterval double类型  延时几分钟开始
 *  @param inBlock        执行的事件
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer
 */
+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
/**
 *  设置一个timer，默认不会加到runloop中，需要手动addTimer:forMode:
 *
 *  @param inTimeInterval double类型  延时几分钟开始
 *  @param inBlock        执行的事件
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer
 */
+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

@end
