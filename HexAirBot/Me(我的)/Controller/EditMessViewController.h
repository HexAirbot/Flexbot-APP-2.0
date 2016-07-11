//
//  EditMessViewController.h
//  HexAirBot
//
//  Created by HHH on 15/12/2.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditMessViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (copy, nonatomic) NSString *textViewValue;
@end
