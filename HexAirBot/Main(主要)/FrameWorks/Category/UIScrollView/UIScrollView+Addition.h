//
//  UIScrollView+Addition.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Addition)

@property(nonatomic) CGFloat contentWidth;
@property(nonatomic) CGFloat contentHeight;
/**
 *  初始化时显示的位置
 */
@property(nonatomic) CGFloat contentOffsetX;
/**
 *  初始化时显示的位置
 */
@property(nonatomic) CGFloat contentOffsetY;

- (CGPoint)topContentOffset;
- (CGPoint)bottomContentOffset;
- (CGPoint)leftContentOffset;
- (CGPoint)rightContentOffset;

- (BOOL)isScrolledToTop;
- (BOOL)isScrolledToBottom;
- (BOOL)isScrolledToLeft;
- (BOOL)isScrolledToRight;

/**
 *  动画滑动到边缘位置
 *
 *  @param animated 动画
 */
- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;

/**
 *  获取当前显示在主窗口的垂直页面  从  0  开始
 *
 *  @return 当前垂直显示的页面
 */
- (NSUInteger)verticalPageIndex;
/**
 *  获取当前显示在主窗口的水平页面  从  0  开始
 *
 *  @return 当前水平显示的页面
 */
- (NSUInteger)horizontalPageIndex;


/**
 *  垂直滑动到第几页  从  0  开始
 *
 *  @param pageIndex 页码
 *  @param animated  动画
 */
- (void)scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
/**
 *  水平滑动到第几页  从  0  开始
 *
 *  @param pageIndex 页码
 *  @param animated  动画
 */
- (void)scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
