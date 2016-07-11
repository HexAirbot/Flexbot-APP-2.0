//
//  UIScrollView+Pages.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Pages)

/**
 *  水平方向的总共页数  从  1  开始
 *
 *  @return 当前页面
 */
- (NSInteger)pages;
/**
 *  获取当前水平方向的页码   从  0   开始
 *
 *  @return 当前页面
 */
- (NSInteger)currentPage;
/**
 *  获取当前水平方向的滑动百分比  0~1
 *
 *  @return 百分比
 */
- (CGFloat)scrollPercent;

- (CGFloat)pagesY;
- (CGFloat)pagesX;
- (CGFloat)currentPageY;
- (CGFloat)currentPageX;


/**
 *  滑动到指定的页面  从  0  开始
 *
 *  @param page 页码
 */
- (void)setPageY:(CGFloat)page;
/**
 *  滑动到指定的页面  从  0  开始
 *
 *  @param page 页码
 */
- (void)setPageX:(CGFloat)page;
/**
 *  滑动到指定的页面  从  0  开始
 *
 *  @param page     页码
 *  @param animated 动画
 */
- (void)setPageY:(CGFloat)page animated:(BOOL)animated;
/**
 *  滑动到指定的页面  从  0  开始
 *
 *  @param page     页码
 *  @param animated 动画
 */
- (void)setPageX:(CGFloat)page animated:(BOOL)animated;


@end
