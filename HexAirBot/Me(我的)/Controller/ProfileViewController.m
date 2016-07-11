//
//  ProfileViewController.m
//  HexAirBot
//
//  Created by HHH on 15/12/2.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "ProfileViewController.h"
#import "EditMessViewController.h"
#import "FeedbackViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
//    _titArr = @[@"Name",@"Location",@"What's up"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdet = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdet];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdet];
        
    }
    
    

//    NSArray *titArr = @[[User sharedUser].userName,[User sharedUser].userLoction,[User sharedUser].userIntroduction];
    
    cell.textLabel.text = _titArr[indexPath.section];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([_isProfileView isEqualToString:@"1"])
    {
        EditMessViewController *editMessViewController = [[EditMessViewController alloc]init];
        editMessViewController.title = _titArr[indexPath.section];
        
        switch (indexPath.section) {
            case 0:
                 editMessViewController.textViewValue = [UserDefaul objectForKey:UserName];
                break;
            case 1:
                editMessViewController.textViewValue = [UserDefaul objectForKey:UserLocation];
                break;
            case 2:
                editMessViewController.textViewValue = [UserDefaul objectForKey:UserIntroduction];
                break;
                
            default:
                break;
        }
        
        [self.navigationController pushViewController:editMessViewController animated:YES];
        
    }else if ([_isProfileView isEqualToString:@"0"])//settingView
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Point" message:@"Do you want to reset the beginner's guide?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
        FeedbackViewController *VC = [[FeedbackViewController alloc]init];
        
        switch (indexPath.section) {
        case 0:
                [alert show];
            break;
        case 1:
                NSLog(@"About页面敬请期待！！");
            break;
        case 2:
            [self.navigationController pushViewController:VC animated:YES];
            break;
            
        default:
            break;
        }
        
    }
    
}




@end
