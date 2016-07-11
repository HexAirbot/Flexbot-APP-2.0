//
//  UIButton+Timmer.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Timmer)

//[self.CountDownBtn startTime:60 title:@"开始" waitTittle:@"秒"];
- (void)startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle;
@end
