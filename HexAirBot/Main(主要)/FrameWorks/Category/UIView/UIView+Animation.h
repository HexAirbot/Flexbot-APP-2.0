//
//  UIView+Animation.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

float radiansForDegrees(int degrees);

@interface UIView (Animation)

// Moves
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
/**
 *  动画移动试图
 *
 *  @param destination View将要移动到的位置   （左上角点的坐标）
 *  @param secs        动画的时间
 *  @param option      枚举
 *  @param delegate    必须是  self
 *  @param method      动画完成后要运行的事件
 */
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
/**
 *  快速移动到指定位置
 *
 *  @param destination  View将要移动到的位置   （左上角点的坐标）
 *  @param withSnapBack 有10像素的返回效果
 */
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
//旋转
- (void)rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
/**
 *  放大或缩小
 *
 *  @param secs     动画时间
 *  @param scaleX   放大或缩小的倍数
 *  @param scaleY   放大或缩小的倍数
 *  @param delegate self
 *  @param method   完成后执行的事件
 */
- (void)scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
/**
 *  使View一直顺时针旋转 永不停息
 *
 *  @param secs 旋转一圈所需要的时间
 */
- (void)spinClockwise:(float)secs;
/**
 *  使View一直逆时针旋转 永不停息
 *
 *  @param secs 旋转一圈所需要的时间
 */
- (void)spinCounterClockwise:(float)secs;

// Transitions
/**
 *  由透明变为完全显示
 *
 *  @param secs 时间
 */
- (void)curlDown:(float)secs;
/**
 *  由完全显示变为完全透明
 *
 *  @param secs 时间
 */
- (void)curlUpAndAway:(float)secs;
/**
 *  向排水一样   View旋转着变小消失
 *
 *  @param secs 时间
 */
- (void)drainAway:(float)secs;

// Effects
/**
 *  动画改变View的透明度
 *
 *  @param newAlpha 需要改变到的透明度
 *  @param secs     时间
 */
- (void)changeAlpha:(float)newAlpha secs:(float)secs;
/**
 *  动画展示View的明暗变化
 *
 *  @param secs         时间
 *  @param continuously 是否一直重复这个动作
 */
- (void)pulse:(float)secs continuously:(BOOL)continuously;

//add subview
/**
 *  动画添加子视图
 *
 *  @param subview 子视图
 */
- (void)addSubviewWithFadeAnimation:(UIView *)subview;

@end
