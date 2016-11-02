//
//  ViewController.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/4/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak,nonatomic)IBOutlet UIImageView *image;
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *arrPeopleInfo;
-(void)loadData;
@end

