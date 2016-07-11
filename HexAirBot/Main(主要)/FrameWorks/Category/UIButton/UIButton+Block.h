//
//  UIButton+Block.h
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (Block)

/**
 *  UIButton的点击事件用代码块来执行
 *
 *  @param touchHandler 执行的事件
 */
-(void)addActionHandler:(TouchedBlock)touchHandler;

@end
