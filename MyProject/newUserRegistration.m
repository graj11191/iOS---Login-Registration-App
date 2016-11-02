//
//  newUserRegistration.m
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/4/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import "newUserRegistration.h"
@implementation newUserRegistration

@synthesize englishcheckbox;
@synthesize tamilcheckbox;
@synthesize hindicheckbox;
@synthesize germancheckbox;
@synthesize frenchcheckbox;
@synthesize malayalamcheckbox;
@synthesize telugucheckbox;
@synthesize selectedreligionlabel;
@synthesize selectedreligiontextfield;

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [religionpicker count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [religionpicker objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [selectedreligiontextfield setText: [religionpicker objectAtIndex:row]];
    //pickerView.hidden=YES;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.dbManager = [[DBManager alloc]initWithDatabaseFilename:@"DB.sql"];
    //assigning delegates
    _emailid.delegate=self;
    _password.delegate=self;
    _confirmpassword.delegate=self;
    _agetextfield.userInteractionEnabled = NO;
    selectedreligiontextfield.userInteractionEnabled = NO;
    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.dateSelection setInputView:datePicker];
    
    //religion pickerview values
    religionpicker = [[NSArray alloc]initWithObjects:@"Hindu",@"Christian",@"Muslim",nil];
    
    //setting default boolean values for ckeckboxes
    englishchecked = NO;
    hindichecked = NO;
    frenchchecked = NO;
    tamilchecked = NO;
    teluguchecked = NO;
    malayalamchecked = NO;
    germanchecked = NO;
    pickerviewhidden = YES;
    
    //creating buttons for male and female checkboxes
    self.malebutton.layer.cornerRadius = 10;
    self.malebutton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.femalebutton.layer.cornerRadius = 10;
    self.femalebutton.layer.borderColor = [[UIColor blackColor]CGColor];
    [self.malebutton setTitle:@"." forState:UIControlStateNormal];
    [self.femalebutton setTitle:@"" forState:UIControlStateNormal];
}

- (IBAction)hiddenbuttonaction:(id)sender {
    pickerviewhidden = NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //check the passwords when textfield has started editing
    NSString *emailRegex = @"^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
    //creating a regular expression, then checking the text for valid e-mail id
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSString *passwordRegex = @"^((?=\\S*?[A-Z])(?=\\S*?[a-z])(?=\\S*?[0-9]).{0,9})\\S$";
    NSPredicate *passwordpredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    
    //checking if email ID meets the requirements
    if(textField==self.emailid)
    {
        if([predicate evaluateWithObject:_emailid.text])
        {
            _emailid.backgroundColor = [UIColor clearColor];
        }
        else
        {
            _emailid.backgroundColor = [UIColor redColor];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email does not meet requirements" message:@"Please enter a valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    //checking if password meets requirements
    else if(textField==self.password)
    {
        if([passwordpredicate evaluateWithObject:_password.text])
        {
            _password.backgroundColor = [UIColor clearColor];
            _confirmpassword.backgroundColor = [UIColor clearColor];
        }
        else
        {
            _password.backgroundColor = [UIColor redColor];
            _confirmpassword.backgroundColor = [UIColor redColor];
            //showing a alert popup
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Password does not meet requirements" message:@"It should consist of One capital letter, One small letter, One number and One special character" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (IBAction)malebuttonclick:(id)sender {
    //action to be performed when male is clicked
    [self.malebutton setTitle:@"." forState:UIControlStateNormal];
    [self.femalebutton setTitle:@"" forState:UIControlStateNormal];
    _maleval.text = @"Male";
    _femaleval.text = @"";
}

- (IBAction)femalebuttonclick:(id)sender {
    //action to be performed when male is clicked
    [self.femalebutton setTitle:@"." forState:UIControlStateNormal];
    [self.malebutton setTitle:@"" forState:UIControlStateNormal];
    _maleval.text = @"";
    _femaleval.text = @"Female";
}

- (IBAction)dateSelectionTapped:(id)sender {
    //action performed when date is tapped
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/mm/yyyy"];
        self.dateSelection.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    NSDate *fromDate = datePicker.date;
        [self.dateSelection resignFirstResponder];
    [self age:fromDate];
}

- (void)age:(NSDate *)fromDate {
    //comparing the selected date with today's date
    NSDate *toDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDate];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDate];
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    //NSLog(@"age in days %ld", (long)[difference day]);
    NSInteger days = [difference day]/365;
    NSString *years = [NSString stringWithFormat:@"%ld",(long)days];
    //setting the age calcuated to the age text field
    self.agetextfield.text = years;
}

- (IBAction)englishcheckboxclick:(id)sender {
    
   //action for englishcheckbox checked
    if(!englishchecked)
    {
        [englishcheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        englishchecked = YES;
        _englishval.text = @"English";
    
    }
    else if(englishchecked)
    {
        [englishcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        englishchecked = NO;
        _englishval.text = @"";
    }
}
- (IBAction)hindicheckboxclicked:(id)sender {
    
    //action for hindicheckbox checked
    if(!hindichecked)
    {
        [hindicheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        hindichecked = YES;
        _hindival.text = @"Hindi";
    }
    else if(hindichecked)
    {
        [hindicheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        hindichecked = NO;
        _hindival.text = @"";
    }

}
- (IBAction)frenchcheckboxclick:(id)sender {
    
    //action for frenchcheckbox checked
    if(!frenchchecked)
    {
        [frenchcheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        frenchchecked = YES;
        _frenchval.text = @"French";
    }
    else if(frenchchecked)
    {
        [frenchcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        frenchchecked = NO;
        _frenchval.text = @"";
    }

}
- (IBAction)tamilcheckboxclicked:(id)sender {
    
    //action for tamilcheckbox checked
    if(!tamilchecked)
    {
        [tamilcheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        tamilchecked = YES;
        _tamilval.text = @"Tamil";
    }
    else if(tamilchecked)
    {
        [tamilcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        tamilchecked = NO;
        _tamilval.text = @"";
    }

}
- (IBAction)telugucheckboxclicked:(id)sender {
    
    //action for telugucheckbox checked
    if(!teluguchecked)
    {
        [telugucheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        teluguchecked = YES;
        _teluguval.text = @"Telugu";
    }
    else if(teluguchecked)
    {
        [telugucheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        teluguchecked = NO;
        _teluguval.text = @"";
    }

}
- (IBAction)germancheckboxclicked:(id)sender {
    
    //action for germancheckbox checked
    if(!germanchecked)
    {
        [germancheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        germanchecked = YES;
        _germanval.text = @"German";
    }
    else if(germanchecked)
    {
        [germancheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        germanchecked = NO;
        _germanval.text = @"";
    }

}


- (IBAction)malayalamcheckboxclicked:(id)sender {
    
    //action for malayalamcheckbox checked
    if(!malayalamchecked)
    {
        [malayalamcheckbox setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
        malayalamchecked = YES;
        _malayalamval.text = @"Malayalam";
    }
    else if(malayalamchecked)
    {
        [malayalamcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        malayalamchecked = NO;
        _malayalamval.text = @"";
    }
}

- (IBAction)submitbuttonclick:(id)sender {
    
    //action for the submit button click
    if([_usernameTextfield.text isEqualToString:@""]||[_fathersnameTextfield.text isEqualToString:@""]||[_password.text isEqualToString:@""]||[_confirmpassword.text isEqualToString:@""]||[_agetextfield.text isEqualToString:@""]||[_emailid.text isEqualToString:@""] )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Details missing" message:@"Please enter all the details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        //checking if the password and confirm password text is the same
        if(_password.text == _confirmpassword.text)
        {
            //if everything is correct, run the query and send details to DB
            NSString *query = [NSString stringWithFormat:@"insert into userdetails values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",_usernameTextfield.text,_fathersnameTextfield.text,_agetextfield.text,selectedreligiontextfield.text,_maleval.text,_femaleval.text,_emailid.text,_password.text,_confirmpassword.text,_englishval.text,_hindival.text,_frenchval.text,_tamilval.text,_teluguval.text,_malayalamval.text,_germanval.text];
            [self.dbManager executeQuery:query];
            if(self.dbManager.affectedRows!=0){
                NSLog(@"Query was executed successfully, affected rows =%d",self.dbManager.affectedRows);
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                //query is not executed
                NSLog(@"Query not executed");
            }
            //Displaying alert if the details are submitted
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Details submitted successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            //Displaying alert if the details are not submitted
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passwords do not match" message:@"Please check your password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (IBAction)resetButtonClick:(id)sender {
    //action for the reset button, clears all the values in textfields and checkboxes
    _usernameTextfield.text = @"";
    _fathersnameTextfield.text = @"";
    _emailid.text = @"";
    _password.text= @"";
    _confirmpassword.text = @"";
    _emailid.backgroundColor = [UIColor clearColor];
    _password.backgroundColor = [UIColor clearColor];
    _confirmpassword.backgroundColor = [UIColor clearColor];
    _agetextfield.text = @"";
    [englishcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [hindicheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [frenchcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [tamilcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [telugucheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [germancheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    [malayalamcheckbox setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
}
@end
