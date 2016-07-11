//
//  HomeViewController.m
//  HexAirBot
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *pauseImage;
}
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"FlexFlight";
    CGFloat height=self.view.frame.size.height-64-48;
    UIView *video=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height*1/2)];
    video.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:video];
    
    UIView *searchFlex=[[UIView alloc]initWithFrame:CGRectMake(0,video.frame.size.height, self.view.frame.size.width,height*1/2)];
    [self.view addSubview:searchFlex];
    
    NSURL *url=[NSURL URLWithString:@"file:///Users/huangdaneng/Desktop/HexAirBot/Album/Video/video.mp4"];
    playerViewController=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
    playerViewController.moviePlayer.controlStyle=MPMovieControlStyleNone;
    playerViewController.moviePlayer.scalingMode=MPMovieScalingModeFill;
    [playerViewController.view setFrame:video.frame];
    [playerViewController.moviePlayer play];
    [video addSubview:playerViewController.view];
    
    UIView *clearView=[[UIView alloc]initWithFrame:video.frame];
    clearView.backgroundColor=[UIColor clearColor];
    [playerViewController.view addSubview:clearView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pauseClick)];
    tap.numberOfTapsRequired=1;
    [clearView addGestureRecognizer:tap];
    
    pauseImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [pauseImage setImage:[UIImage imageNamed:@"pause.png"]];
    pauseImage.center=video.center;
    [clearView addSubview:pauseImage];
    pauseImage.hidden=YES;
    
}
-(void)pauseClick
{
    static BOOL pause=YES;
    if (pause) {
        pauseImage.hidden=NO;
        [playerViewController.moviePlayer pause];
        pause=NO;
    }else{
        pauseImage.hidden=YES;
        [playerViewController.moviePlayer play];
        pause=YES;
    }
}


@end
