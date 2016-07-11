//
//  NavigationController.m
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "NavigationController.h"
#import "BasicSetting.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+Extend.h"
#import "UIImage+Extend.h"
#import "BasicFrameWork.h"

@interface NavigationController ()

@end

@implementation NavigationController


#pragma mark- 当导航控制器的view创建完毕就调用
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


#pragma mark- 第一次调用类的时候会调用一次该方法
+ (void)initialize
{
//    [super initialize];
    //设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
     
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

#pragma mark- 设置UIBarButtonItem的主题
+ (void)setupBarButtonItemTheme
{
    //通过设置appearance对象，能够修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    //设置文字的属性
    //1.设置普通状态下文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体
    textAttrs[NSFontAttributeName] = BarButtonItemCharcterNorFont;

    //设置颜色为橙色
    textAttrs[NSForegroundColorAttributeName] = BarButtonItemCharcterNorColor;
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    
    
    //2.设置高亮状态下文字的属性
    //使用1中的textAttrs进行通用设置
    NSMutableDictionary *hightextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为红色
    hightextAttrs[NSForegroundColorAttributeName] = BarButtonItemCharcterHighlightedColor;
    [appearance setTitleTextAttributes:hightextAttrs forState:UIControlStateHighlighted];
    
    
    
    
    //3.设置不可用状态下文字的属性
    //使用1中的textAttrs进行通用设置
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为灰色
    disabletextAttrs[NSForegroundColorAttributeName] = BarButtonItemCharcterDisabledColor;
    [appearance setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];

    
    
    
    //设置背景
    //技巧提示：为了让某个按钮的背景消失，可以设置一张完全透明的背景图片
    [appearance setBackButtonBackgroundImage:[UIImage imageNamed:@"NetWork.bundle/navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    
}


#pragma mark- 设置UINavigationBar的主题
+ (void)setupNavigationBarTheme
{
    //通过设置appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    
    /*
     模拟器在切换到ios7之后，导航栏下角有一条阴影线。是因为ios中，66-64多出了2个像素点。把导航栏的背景去掉后，即可解决。
     在设置导航栏背景的时候，进行一次判断，如果是ios7那么就不设置导航栏背景。
     */
    //设置导航栏的背景
    if (!isiOS7)
    {
        appearance.clipsToBounds = YES;
        [appearance setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        appearance.shadowImage = [[UIImage alloc]init];
    }

    //设置导航栏的背景
//    [appearance setBackgroundImage:[UIImage resizeWithImageName:@"navigationBar_background"] forBarMetrics:UIBarMetricsDefault];
    [appearance setBarTintColor:hexColor(FF9999)];
    
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体颜色
    textAttrs[NSForegroundColorAttributeName] = NavigationBarCharcterColor;
    //设置字体
    textAttrs[NSFontAttributeName] = NavigationBarCharcterFont;
    
    
    
    [appearance setTitleTextAttributes:textAttrs];
    

}
#pragma mark- 
#pragma mark- 在iOS7中修改状态栏字体的颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
