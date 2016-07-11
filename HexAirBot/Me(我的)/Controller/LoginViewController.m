//
//  LoginViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/1.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "WeiboSDK.h"
#import <ShareSDK/SSDKUser.h>

@interface LoginViewController ()

@property (nonatomic, strong) SSDKUser *ssDKUser;
@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sinInAndUpLab.text = self.labValueStr;
}

- (SSDKUser *)ssDKUser
{
    if (!_ssDKUser) {
        _ssDKUser = [[SSDKUser alloc]init];
    }
    return _ssDKUser;
}

- (IBAction)FaceBookBtn:(id)sender
{
    [ShareSDK getUserInfo:SSDKPlatformTypeFacebook onStateChanged:^(SSDKResponseState state, SSDKUser *SDKUser, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
     {
         [self dealWillMess:SDKUser];
         
     }else if(state == SSDKResponseStateFail)
     {
         NSLog(@"===Weibo尝试连接失败=====");
         
     }else{
         
         NSLog(@"Weibo error = %@",error);
     }
         
     }];
}
- (IBAction)weiboBtn:(UIButton *)sender
{
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *SDKUser, NSError *error) {
        
        if (state == SSDKResponseStateSuccess)
        {
            [self dealWillMess:SDKUser];
            
        }else if(state == SSDKResponseStateFail)
        {
            NSLog(@"===Weibo尝试连接失败=====");
            
        }else{
            
            NSLog(@"Weibo error = %@",error);
        }

    }];
    

}


-(void)dealWillMess:(SSDKUser *)SDKUser
{
    [MBProgressHUD showMessage:@"正在提交..."];
    AVQuery *que =[AVQuery queryWithClassName:@"UserMess"];
    
    [que findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (objects.count == 0)//这一步骤只为了防止数据库的表为空
        {
            //添加新用户
            AVObject *newUser = [AVObject objectWithClassName:@"UserMess"];
            [self setUpObject:newUser ssdk:SDKUser];

            [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                
                if (succeeded)
                {
                    [MBProgressHUD hideHUD];
                    [UserDefaul setObject:newUser.objectId forKey:ObjectID];
                    
                    [self getSSDKValueWithDefaul:SDKUser];
                    
                    [MBProgressHUD showSuccess:@"登陆成功"];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }else
                {
                    [MBProgressHUD hideHUD];
                    [MBProgressHUD showError:@"登陆失败"];
                }
            }];
        }else{
            for (int i = 0; i < objects.count; i++)
            {
                AVObject *tempObj = objects[i];
                if (![RegularExpression validateIsBlankString:[tempObj objectForKey:UserID]])
                {
                    //旧用户（编辑资料）
                    if ([SDKUser.uid isEqualToString:[tempObj objectForKey:UserID]])
                    {
                        
                        [MBProgressHUD hideHUD];
                        //获取到objID,
                        [self getObjectValueWithDefaul:tempObj];
                        
                        [UserDefaul setObject:[tempObj objectForKey:UserIconData] forKey:UserIconData];
                        
                        [self.navigationController popToRootViewControllerAnimated:YES];
                        
                    }else{
                        
                        //添加新用户
                        AVObject *newUsers = [AVObject objectWithClassName:@"UserMess"];
                        [self setUpObject:newUsers ssdk:SDKUser];

                        [newUsers saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            
                            if (succeeded)
                            {
                                [MBProgressHUD hideHUD];
                                
                                [self getObjectValueWithDefaul:newUsers];
                                
                                [MBProgressHUD showSuccess:@"登陆成功"];
                                [self.navigationController popToRootViewControllerAnimated:YES];
                            }else
                            {
                                [MBProgressHUD hideHUD];
                                [MBProgressHUD showError:@"登陆失败"];
                            }
                        }];
                        
                        
                    }
                }
                
                
            }
        }
        
        
        
    }];
    
}

-(void)getSSDKValueWithDefaul:(SSDKUser *)ssdk
{
    [UserDefaul setObject:ssdk.uid forKey:UserID];
    [UserDefaul setObject:ssdk.nickname forKey:UserName];
    [UserDefaul setObject:ssdk.icon forKey:UserIcon];
    [UserDefaul setObject:@"Location" forKey:UserLocation];
    [UserDefaul setObject:ssdk.aboutMe forKey:UserIntroduction];
}


-(void)getObjectValueWithDefaul:(AVObject *)Obj
{
    [UserDefaul setObject:Obj.objectId forKey:ObjectID];
    
    [UserDefaul setObject:[Obj objectForKey:UserID] forKey:UserID];
    [UserDefaul setObject:[Obj objectForKey:UserName] forKey:UserName];
    [UserDefaul setObject:[Obj objectForKey:UserIcon] forKey:UserIcon];
    [UserDefaul setObject:@"Location" forKey:UserLocation];
    [UserDefaul setObject:[Obj objectForKey:UserIntroduction] forKey:UserIntroduction];
}

//第三方获取到的数据保存到数据库
-(void)setUpObject:(AVObject *)getOjb ssdk:(SSDKUser *)ssdk
{
    //添加新用户
    [getOjb setObject:ssdk.nickname forKey:UserName];
    [getOjb setObject:ssdk.uid forKey:UserID];
    [getOjb setObject:ssdk.aboutMe forKey:UserIntroduction];
    [getOjb setObject:ssdk.icon forKey:UserIcon];
    [getOjb setObject:@"Location" forKey:UserLocation];
}



@end
