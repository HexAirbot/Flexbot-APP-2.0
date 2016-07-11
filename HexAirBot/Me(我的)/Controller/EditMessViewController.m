//
//  EditMessViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/2.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "EditMessViewController.h"
#import "ProfileViewController.h"

@interface EditMessViewController ()<UITextViewDelegate>

@end

@implementation EditMessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = self.textViewValue;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"NetWork.bundle/navBack"]
                      forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"NetWork.bundle/navBackHL"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(saveEditMess)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = (CGRect){CGPointZero,button.currentBackgroundImage.size};
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = menuButton;
    
}


- (void)saveEditMess
{
    AVObject *userObj = [AVObject objectWithoutDataWithClassName:@"UserMess" objectId:[UserDefaul objectForKey:ObjectID]];
    
    if (![RegularExpression validateIsBlankString:[UserDefaul objectForKey:UserID]])
    {
        NSString *tempStr = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        NSString *tempValue = [self.textViewValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([tempStr isEqualToString:self.textViewValue])
        {
            [self.navigationController popViewControllerAnimated:YES];
            return;//若没有改变，不提交
        }
        
        if ([self.title isEqualToString:@"Name"])
        {
            
            [userObj setObject:tempStr forKey:UserName];
            [userObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded)
                {
                    [MBProgressHUD showSuccess:@"Name保存成功"];
                    [UserDefaul setObject:tempStr forKey:UserName];
                }else{
                    [MBProgressHUD showError:@"Name保存失败"];
                }
            }];
            
        }else if ([self.title isEqualToString:@"Location"])
        {
            
            [userObj setObject:tempStr forKey:UserLocation];
            
            [userObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded)
                {
                    [UserDefaul setObject:tempStr forKey:UserLocation];
                    [MBProgressHUD showSuccess:@"Location保存成功"];
                }else{
                    [MBProgressHUD showError:@"Location保存失败"];
                }
            }];
            
        }else
        {
            
            [userObj setObject:tempStr forKey:UserIntroduction];
            [userObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [UserDefaul setObject:tempStr forKey:UserIntroduction];
                    [MBProgressHUD showSuccess:@"Introduction保存成功"];
                }else{
                    [MBProgressHUD showError:@"Introduction保存失败"];
                }
            }];
        }
    
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        NSLog(@"从第三方获取到的用户ID为空");
    }

}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    
        [self saveEditMess];
        
        return NO;
    }
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textView resignFirstResponder];
    
}


@end
