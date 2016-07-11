//
//  WebViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/14.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *reqest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.webURLStr]];
    
    [self.webView loadRequest:reqest];
    
}


@end
