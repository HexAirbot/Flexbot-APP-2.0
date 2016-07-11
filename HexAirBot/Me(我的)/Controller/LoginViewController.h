//
//  LoginViewController.h
//  HexAirBot
//
//  Created by HHH on 15/12/1.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *sinInAndUpLab;

@property (copy, nonatomic) NSString *labValueStr;
- (IBAction)weiboBtn:(UIButton *)sender;

@end
