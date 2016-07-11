//
//  UITextView+PlaceHolder.h
//  FengHeJia
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 慧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITextView (PlaceHolder) <UITextViewDelegate>

@property (strong, nonatomic) UITextView *placeHolderTextView;

- (void)addPlaceHolder:(NSString *)placeHolder;

@end
