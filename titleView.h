//
//  titleView.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/4/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleView : UIViewController
@property (strong,nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmpassword;
@end
