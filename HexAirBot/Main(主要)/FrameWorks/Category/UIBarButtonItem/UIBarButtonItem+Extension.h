//
//  UIBarButtonItem+Extension.h
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BarButtonActionBlock)();

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName ActionBlock:(BarButtonActionBlock)actionBlock;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title imageName:(NSString *)imageName highImageName:(NSString *)highImageName ActionBlock:(BarButtonActionBlock)actionBlock;
@end
