//
//  MeViewController.h
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *quitView;

- (IBAction)quitBtnClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *buyView;

@property (weak, nonatomic) IBOutlet UIView *printingView;

@property (weak, nonatomic) IBOutlet UIView *settingView;

- (IBAction)buyCellClick:(UITapGestureRecognizer *)sender;

- (IBAction)prinCellClick:(UITapGestureRecognizer *)sender;

- (IBAction)SettingCellClick:(UITapGestureRecognizer *)sender;
@end
