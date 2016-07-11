//
//  FeedbackViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation FeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Feedback";
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animationTextField:textField up:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animationTextField:textField up:NO];
}

- (void)animationTextField:(UITextField *)textField up:(BOOL)isUp
{
    if (self.view.frame.size.width <= 320)
    {
        const int moveDisten = 80;
        int movement = (isUp ? -moveDisten:moveDisten);
        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:0.20];
        
        //CGRectOffset(frame值, 控件的x位置, 控件的y位置);
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        
        [UIView commitAnimations];//动画开始
    }
    
}

- (IBAction)sumitBtnClick:(UIButton *)sender
{
    AVObject *feedbackObj = [AVObject objectWithClassName:@"Feedback"];
    [feedbackObj setObject:self.textView.text forKey:@"Content"];
    [feedbackObj setObject:self.textFeild.text forKey:@"email"];
    
    
    if ([RegularExpression validateIsBlankString:[UserDefaul objectForKey:UserID]])
    {
        [MBProgressHUD showError:@"请先登录"];
        return ;
    }
    
    
    if (![RegularExpression validateIsBlankString:self.textView.text])
    {
//        
//        [feedbackObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
//         {
//             
//             if (succeeded)
//             {
//                 [MBProgressHUD showSuccess:@"提交成功"];
//                 
//             }else
//             {
//                 [MBProgressHUD showError:@"提交失败"];
//             }
//         }];
       
        
    }else{
        
        [MBProgressHUD showError:@"请输入信息"];
    }
    
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
