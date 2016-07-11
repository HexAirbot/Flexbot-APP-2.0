//
//  UIView+ViewController.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)
/*
 通过UIView对象获取该对象所属的UIViewController可以使用UIResponder的nextResponder方法获得，UIView类继承于UIResponder，因此可以直接使用。
 根据文档描述，如果View有view controller，则通过nextResponder方法返回，如果没有则返回superview。
 下面是英文原文：
 if the view has a view controller, it is returned by nextResponder.
 If there is no view controller, the method will return the superview
 相关代码如下：遍历该View的树形结构，获取到其所属的ViewController
 */
- (UIViewController *)viewController
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
