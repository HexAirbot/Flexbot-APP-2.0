//
//  UIImage+Extension.h
//  BasicFrame
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据图片名返回一张能自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
@end
