//
//  MeViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/3.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeadView.h"
#import "HttpTool.h"
#import "JSONKit.h"

#import "LoginViewController.h"
#import "ProfileViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "WebViewController.h"



@interface MeViewController ()<MeHeadViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MeViewController
{
    MeHeadView *headView;
    NSArray *userInfoArr;
    NSString *LocationIP;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [HttpTool get:@"http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json" params:nil success:^(id responseObj)
     {
         
         NSData *jsonData = [responseObj JSONData];
         NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
         LocationIP = dataDic[@"country"];
         
     } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupHeaderView];
}

- (void)setupHeaderView
{
    
    NSString *userId = [UserDefaul objectForKey:UserID];
    headView = [MeHeadView getMeHeadView:userId ];
    headView.delegateHead = self;
    headView.width = SCREEN_WIDTH;
    if ([RegularExpression validateIsBlankString:userId]) {
        self.quitView.hidden = YES;
    }else{
        self.quitView.hidden = NO;
    }
    [self.view addSubview:headView];
}
-(void)userSignIn:(UIButton *)btn
{
    [self loginIN];
}
-(void)loginIN
{
    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    
    loginViewController.labValueStr = getLocalizeString(@"Sign in with");
    loginViewController.title = @"Sign in";
    [self.navigationController pushViewController:loginViewController animated:YES];
}
-(void)userSignUp:(UIButton *)btn
{
    LoginViewController *loginViewController = [[LoginViewController alloc]init];
    loginViewController.title = @"Sign up";
    loginViewController.labValueStr = @"Sign up with";
    [self.navigationController pushViewController:loginViewController animated:YES];
}
-(void)userIconClick:(UIButton *)tap
{
    
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:@"Change avatar"
                                    delegate:self
                                    cancelButtonTitle:@"Cancel"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"Camera roll", @"Take photo",nil];
    [myActionSheet showInView:self.view];

}
-(void)localCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    
    if (status == ALAuthorizationStatusRestricted || status == ALAuthorizationStatusDenied) {
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"无法访问相册" message:@"请在“设置-隐私-照片”选项中允许访问你的相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;//图片可被编辑
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else{
        NSLog(@"请检查相机测试");
    }
    
}

#pragma mark-UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://相册
            [self localCamera];
            break;
        case 1://拍照
            [self takePhoto];
            break;
        default:
            break;
    }

}

-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *photoPic = [[UIImagePickerController alloc]init];
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        AVAuthorizationStatus authSatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];

        if (authSatus == AVAuthorizationStatusRestricted || authSatus == AVAuthorizationStatusDenied) {
            
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"无法拍照" message:@"请在“设置-隐私-相机”选项中允许访问你的相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        
        photoPic.delegate = self;
        photoPic.allowsEditing = YES;
        photoPic.sourceType = sourceType;
        
        [self presentViewController:photoPic animated:YES completion:^{
            
        }];
        
    }else{
        NSLog(@"没摄像头");
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *aaa = info[UIImagePickerControllerOriginalImage];
    
    UIImage *img = [self scaleFromImage:aaa toSize:CGSizeMake(100, 100)];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        NSData *imgData = UIImagePNGRepresentation(img);
        
        AVObject *editObj = [AVObject objectWithoutDataWithClassName:@"UserMess" objectId:[UserDefaul objectForKey:ObjectID]];
        
            [editObj setObject:imgData forKey:UserIconData];
        [editObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
           
            if (succeeded) {
                
                [MBProgressHUD showSuccess:@"更改成功"];
                [UserDefaul setObject:imgData forKey:@"IconData"];
                
            }else
            {
                [MBProgressHUD showError:@"更改失败"];
            }
        }];
        
    
        UIImage *setImg = [UIImage imageWithData:imgData];
        [headView.userIconBTN setBackgroundImage:setImg forState:0];
        
        
    }];
}
// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)userMessClick:(UIButton *)tap
{
    ProfileViewController *profileViewController = [[ProfileViewController alloc]init];
    profileViewController.title = @"Profile";
    profileViewController.isProfileView = @"1";
    
    profileViewController.titArr = @[@"Name",@"Location",@"What's up"];
    [self.navigationController pushViewController:profileViewController animated:YES];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            [UserDefaul removeObjectForKey:UserID];
            [UserDefaul removeObjectForKey:ObjectID];
            [UserDefaul removeObjectForKey:UserIcon];
            [UserDefaul removeObjectForKey:UserIntroduction];
            [UserDefaul removeObjectForKey:UserLocation];
            [UserDefaul removeObjectForKey:UserName];
            [UserDefaul removeObjectForKey:@"IconData"];
            [self loginIN];
            
            break;
            
        default:
            break;
    }
}

- (IBAction)quitBtnClick:(UIButton *)sender
{
    UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"确定退出" message:@"确定退出当前账号吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [aler show];
    
    
}
- (IBAction)buyCellClick:(UITapGestureRecognizer *)sender
{
    NSLog(@"buy");
    if (![LocationIP isEqualToString:@"中国"])
    {
        
    }else
    {
    
        NSString *tempURL = @"://www.taobao.com/markets/quality/pzsdnz?spm=a21bo.7724922.8407-banners.3.EAbzvH";
        NSString *appURL = [NSString stringWithFormat:@"taobao%@",tempURL];
        NSString *webURL = [NSString stringWithFormat:@"http%@",tempURL];
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appURL]])
        {//淘宝客户端打开
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
            
        }else
        {//用Safari打开网页
//            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:webURL]];
            
            //用webView在此APP打开
            WebViewController * webView = [[WebViewController alloc] init];
            webView.webURLStr = webURL;
            [self.navigationController pushViewController:webView animated:YES];
        }
    }
}

- (IBAction)prinCellClick:(UITapGestureRecognizer *)sender
{
    NSLog(@"print");
    WebViewController * webView = [[WebViewController alloc] init];
    webView.webURLStr = @"http://www.thingiverse.com/Flexbot/designs";
    [self.navigationController pushViewController:webView animated:YES];
}

- (IBAction)SettingCellClick:(UITapGestureRecognizer *)sender
{
     NSLog(@"Setting");
    ProfileViewController *profileViewController = [[ProfileViewController alloc]init];
    profileViewController.title = @"Settings";
    profileViewController.isProfileView = @"0";
    profileViewController.titArr = @[@"Reset beginner's guide",@"About",@"Feedback"];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

@end
