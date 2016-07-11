//
//  TabBarController.m
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import "TabBarController.h"
#import "BasicSetting.h"
#import "NavigationController.h"
#import "BasicFrameWork.h"


#import "HomeViewController.h"
#import "LibraryViewController.h"
#import "MeViewController.h"


@interface TabBarController ()

@property (weak, nonatomic) HomeViewController *homeVC;
@property (weak, nonatomic) LibraryViewController *lib;
@property (weak, nonatomic) MeViewController *meVC;


@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //添加所有的自控制器
    [self addAllChildVcs];

    
    self.delegate=self;
    self.selectedIndex=1;

    // 调整tabbar
    //[self addCustomTabBar];


}
#pragma mark- 添加所有的自控制器
- (void)addAllChildVcs
{
    

    LibraryViewController *lib=[[LibraryViewController alloc]init];
    [self addOneChildVc:lib title:@"Library" imageName:@"tabbar_library" selectedImageName:@"tabbar_library_selected"];
    self.lib = lib;

    
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addOneChildVc:home title:@"Home" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.homeVC = home;
    
    
    
    MeViewController *me = [[MeViewController alloc] init];
    [self addOneChildVc:me title:@"Me" imageName:@"tabbar_me" selectedImageName:@"tabbar_me_selected"];
    self.meVC = me;
    
}
/**
 *  添加一个子控制器
 *
 *  @param childVC           子控制对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    childVc.title = title;
    
    
    //设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    //设置选中时的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    //设置tabBarItem普通状态下文字的颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = TabBarCharcterNorColor;
    textAttrs[NSFontAttributeName] = TabBarCharcterNorFont;
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置tabBarItem选中状态下文字的颜色
    NSMutableDictionary *selectedtextAttrs = [NSMutableDictionary dictionary];
    selectedtextAttrs[NSForegroundColorAttributeName] = TabBarCharcterSelColor;
    selectedtextAttrs[NSFontAttributeName] = TabBarCharcterSelFont;
    
    [childVc.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    
    
    if (isiOS7)
    {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //添加为tabbar控制器的子控制器
    NavigationController *navc = [[NavigationController alloc] initWithRootViewController:childVc];
    
    /**
     *  如果导航栏上没有添加图片，则：
     //当导航栏的translucent属性设置为YES,则在当前视图控制器的坐标原点为屏幕左上角
     //当导航栏的translucent属性设置为NO,则在当前视图控制器的坐标原点在屏幕左上角（往Y轴方向距离导航栏的高度（44））
     如果导航栏上有添加图片，则以下属性可以不设
     */
    navc.navigationBar.translucent = NO;
    [self addChildViewController:navc];
}


#pragma mark- 调整tabbar
- (void)addCustomTabBar
{
    //TabBar *customTabBar = [[TabBar alloc] init];
    // 更换系统自带的tabbar
    //[self setValue:customTabBar forKey:@"tabBar"];
}
//设置状态栏风格
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma mark -UITabBarControllerDelegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==0&&[viewController.title isEqualToString:@"Library"]) {
        return NO;
    }
    return YES;
}

@end
