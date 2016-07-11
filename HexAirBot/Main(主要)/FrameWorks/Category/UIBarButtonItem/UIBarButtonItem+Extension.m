//
//  UIBarButtonItem+Extension.m
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//
#import "UIButton+Block.h"

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)


+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName ActionBlock:(BarButtonActionBlock)actionBlock
{
    //自定义UIView
    UIButton *btn = [[UIButton alloc] init];
    
    //设置按钮的背景图片（默认/高亮）
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    
    
    //设置按钮的尺寸和图片一样大，使用了UIImage的分类
    btn.bounds = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
    
    [btn addActionHandler:^(NSInteger tag) {
        if (actionBlock)
        {
            actionBlock();
        }
    }];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title imageName:(NSString *)imageName highImageName:(NSString *)highImageName ActionBlock:(BarButtonActionBlock)actionBlock
{
    //自定义UIView
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    
    //设置按钮的背景图片（默认/高亮）
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    
    
    //设置按钮的尺寸和图片一样大，使用了UIImage的分类
    btn.bounds = CGRectMake(0, 0, 50, btn.currentBackgroundImage.size.height);
    
    [btn addActionHandler:^(NSInteger tag) {
        if (actionBlock)
        {
            actionBlock();
        }
    }];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}



@end
