//
//  UIBarButtonItem+Action.h
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BarButtonActionBlock)();

@interface UIBarButtonItem (Action)

//@property (nonatomic, copy) dispatch_block_t actionBlock;
/**
 *  UIBarButtonItem的点击事件由代码块执行
 *
 *  @param actionBlock 需要执行的事件
 */
- (void)setActionBlock:(BarButtonActionBlock)actionBlock;
@end
