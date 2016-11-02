//
//  ViewController.m
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/4/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "titleView.h"
#import "DBManager.h"


@interface ViewController ()
@end

@implementation ViewController
@synthesize password;
@synthesize username;
- (void)viewDidLoad {
    username.delegate=self;
    password.delegate=self;
    [super viewDidLoad];
    [self loadData];
    
}

-(void)loadData{
    //function to load data from the DB
    NSString *query = @"select emailid from userdetails where emailid= %@";
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //check the passwords when textfield has started editing
    NSString *emailRegex = @"^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
    //creating a regular expression, then checking the text for valid e-mail id
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *passwordRegex = @"^((?=\\S*?[A-Z])(?=\\S*?[a-z])(?=\\S*?[0-9]).{0,9})\\S$";
    
    NSPredicate *passwordpredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    //checking condition for the email ID
    if(textField==self.username)
    {
    if([predicate evaluateWithObject:username.text])
    {
        //clear colour if the email ID is correct
        username.backgroundColor = [UIColor clearColor];
    }
    else
    {
        //else set the colour to red
        username.backgroundColor = [UIColor redColor];
    }
    }
    else if(textField==self.password)
    {
        //clear colour if the password is correct
        if([passwordpredicate evaluateWithObject:password.text])
        {
            password.backgroundColor = [UIColor clearColor];
        }
        else
        {
            //else set it to red
            password.backgroundColor = [UIColor redColor];
        }
    }
}

- (IBAction)loginbuttontap:(id)sender {
    
    //action performed when the login button is pressed
//    sqlite3_stmt *compiledStatement;
//    NSString *emaiID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,0)];
//    if ([emaiID isEqualToString:username.text])
//    {
//     [self performSegueWithIdentifier:@"titlesegue" sender:nil];
//    }
//    else
    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User not found" message:@"Please enter correct details or click new user registration to register" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert show];
  
    }
//    BOOL userFound = NO;
//    int i=0;
//    for (i=0; i<[_arrPeopleInfo count] ;i++)
//    {
//     if([username.text isEqualToString:_arrPeopleInfo[i]])
//     {
//         userFound = YES;
//         break;
//     }
//    if(userFound){
//        [self performSegueWithIdentifier:@"titlesegue" sender:nil];
//    }
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"User not found" message:@"Please enter correct details or click new user registration to register" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//    }
//    }
  if([username.text isEqualToString:@"gautham@gmail.com"]&&[password.text isEqualToString:@"Qw2@"])
    {
         [self performSegueWithIdentifier:@"titlesegue" sender:nil];
    }
  else if([username.text isEqualToString:@""]&&[password.text isEqualToString:@""] )
  {
      //displaying popup if the username and password fields are empty
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No details entered" message:@"Please enter your Username and Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
      [alert show];
  }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
     {
         //passing the username from the first viewcontroller to the next one
         if([segue.identifier isEqualToString: @"titlesegue"])
         {
        //displaying the username from previous page
         titleView *title =[segue destinationViewController];
         title.name = username.text;
         }
         else if([segue.identifier isEqualToString:@"newUsersegue"])
         {
             
             
         }
         
     }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
