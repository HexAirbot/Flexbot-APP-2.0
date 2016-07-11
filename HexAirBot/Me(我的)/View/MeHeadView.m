//
//  MeHeadView.m
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "MeHeadView.h"

@implementation MeHeadView

+ (instancetype)getMeHeadView:(NSString *)userId
{
    MeHeadView *cell;
    
    if (![RegularExpression validateIsBlankString:userId])
    {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MeHeadView" owner:self options:nil] firstObject];
        
        if ([UserDefaul objectForKey:@"IconData"] == nil)
        {
             [cell.userIconBTN sd_setBackgroundImageWithURL:[NSURL URLWithString:[UserDefaul objectForKey:UserIcon]] forState:0 placeholderImage:[UIImage imageNamed:@"touxiang"]];
        }else{
            
            UIImage *setImg = [UIImage imageWithData:[UserDefaul objectForKey:@"IconData"]];
            [cell.userIconBTN setBackgroundImage:setImg forState:0];
        }
       
        
        cell.userNameLab.text = [UserDefaul objectForKey:UserName];
        cell.userLocLabe.text = [UserDefaul objectForKey:UserLocation];
        cell.userIntroLab.text = [UserDefaul objectForKey:UserIntroduction];
        
    }else{
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MeHeadView" owner:self options:nil] lastObject];
        
    }

    
    return cell;
}
- (IBAction)signInClick:(UIButton *)sender
{
    if (self.delegateHead && [self.delegateHead respondsToSelector:@selector(userSignIn:)]) {
        [self.delegateHead userSignIn:sender];
    }
}


- (IBAction)signUpClick:(UIButton *)sender
{
    if (self.delegateHead && [self.delegateHead respondsToSelector:@selector(userSignUp:)]) {
        [self.delegateHead userSignUp:sender];
    }
}


- (IBAction)messClick:(UIButton *)sender
{
    if (self.delegateHead && [self.delegateHead respondsToSelector:@selector(userMessClick:)]) {
        [self.delegateHead userMessClick:sender];
    }
}

- (IBAction)iconClick:(UIButton *)sender
{
    if (self.delegateHead && [self.delegateHead respondsToSelector:@selector(userIconClick:)])
    {
        
        [self.delegateHead userIconClick:sender];
    }
}


@end
