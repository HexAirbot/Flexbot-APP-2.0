//
//  FeedbackViewController.h
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITextField *textFeild;
- (IBAction)sumitBtnClick:(UIButton *)sender;
@end
