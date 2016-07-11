//
//  MeHeadView.h
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeHeadViewDelegate <NSObject>

-(void)userSignIn:(UIButton *)btn;
-(void)userSignUp:(UIButton *)btn;
-(void)userIconClick:(UIButton *)btn;
-(void)userMessClick:(UIButton *)btn;


@end

@interface MeHeadView : UIView
@property (weak ,nonatomic) id<MeHeadViewDelegate>delegateHead;

+(instancetype)getMeHeadView:(NSString *)userId;

@property (weak, nonatomic) IBOutlet UIButton *signInBtn;

@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;

- (IBAction)signInClick:(UIButton *)sender;

- (IBAction)signUpClick:(UIButton *)sender;


- (IBAction)messClick:(UIButton *)sender;
- (IBAction)iconClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *userIconBTN;
@property (weak, nonatomic) IBOutlet UILabel *userNameLab;
@property (weak, nonatomic) IBOutlet UILabel *userLocLabe;
@property (weak, nonatomic) IBOutlet UILabel *userIntroLab;
@end
