//
//  BasicFrameWork.h
//  NewBasicFrameWork
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#ifndef NewBasicFrameWork_BasicFrameWork_h
#define NewBasicFrameWork_BasicFrameWork_h



#ifdef __OBJC__

#import "UIView+Utils.h"
#import "UIBarButtonItem+Action.h"
#import "UIBarButtonItem+Extension.h"
#import "CALayer+RuntimeAttribute.h"
#import "NSArray+Log.h"
#import "NSDate+Extension.h"
#import "NSDictionary+Log.h"
#import "NSDictionary+SafeAccess.h"
#import "NSArray+SafeAccess.h"
#import "NSNotificationCenter+MainThread.h"
#import "NSTimer+Addition.h"
#import "NSTimer+Blocks.h"
#import "UIButton+BackgroundColor.h"
#import "UIButton+Block.h"
#import "UIButton+Timmer.h"
#import "UIImage+Extend.h"
#import "UIScrollView+Addition.h"
#import "UIScrollView+Pages.h"
#import "UITextView+PlaceHolder.h"
#import "UIView+Nib.h"
#import "UIView+ViewController.h"
#import "UIView+Animation.h"
#import "NSArray+Extend.h"
#import "UIColor+Extend.h"
#import "UIDevice+Extend.h"
//#import "CoreConst.h"
#import "UIImage+ReMake.h"
#import "UIButton+SD.h"
#import "UIImageView+SD.h"
#import "MJExtension.h"
#import "NSArray+CoreListExtend.h"

#import "UITableViewCell+Extend.h"

#endif


#if DEBUG

#define NSLog(FORMAT,...)   NSLog(@"%@文件%d行输出打印:%@",[[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"] lastObject], __LINE__,[NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
#define NSLog(FORMAT, ...) nil
#endif


//代码块self的弱应用
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


// 颜色
#define setColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 是否为iOS7
#define isiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//user沙盒中存储路径
#define USERFAILPATH [[NSString documentFolder] stringByAppendingPathComponent:@"user.data"]

//将user存入沙盒中
#define SAVEUSER [CoreArchive archiveRootObject:[User sharedUser] toFile:USERFAILPATH];

#endif
