//
//  adminPage.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/19/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface adminPage : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)loginbuttonclick:(id)sender;


@end
