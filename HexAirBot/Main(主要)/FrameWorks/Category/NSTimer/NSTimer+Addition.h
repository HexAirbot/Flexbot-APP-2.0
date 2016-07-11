//
//  NSTimer+Addition.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)
/**
 *  停止Timer  Timer的开始时间设置成了遥远的未来
 */
- (void)pauseTimer;
/**
 *  重新开始Timer  Timer的结束事件设置成了现在
 */
- (void)resumeTimer;
/**
 *  在interval秒后重新开始Timer
 *
 *  @param interval 浮点型，interval秒后启动Timer
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
