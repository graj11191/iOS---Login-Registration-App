//
//  adminPage.m
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/19/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import "adminPage.h"

@implementation adminPage
@synthesize username;
@synthesize password;

- (IBAction)loginbuttonclick:(id)sender {
    if([username.text isEqualToString:@"admin"]&&[password.text isEqualToString:@"admin"])
    {
        [self performSegueWithIdentifier:@"titlesegue" sender:nil];
    }
    else
    {
       
    }
    
}
@end
