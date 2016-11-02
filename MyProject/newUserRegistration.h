//
//  newUserRegistration.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/4/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@interface newUserRegistration : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    //creating boolean values for checkboxes
    BOOL englishchecked;
    BOOL hindichecked;
    BOOL frenchchecked;
    BOOL tamilchecked;
    BOOL teluguchecked;
    BOOL malayalamchecked;
    BOOL germanchecked;
    BOOL pickerviewhidden;
    
    UIDatePicker *datePicker;
    UIDatePicker *ageComponents;
    UIDatePicker *year;
    NSArray *pickerData;
    NSArray *religionpicker;
}
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *fathersnameTextfield;

@property (weak, nonatomic) IBOutlet UITextField *dateSelection;
@property (weak, nonatomic) IBOutlet UITextField *emailid;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmpassword;

@property (weak, nonatomic) IBOutlet UIButton *malebutton;
@property (weak, nonatomic) IBOutlet UIButton *femalebutton;
@property (weak, nonatomic) IBOutlet UITextField *dateselection;
@property (weak, nonatomic) IBOutlet UIPickerView *religionpicker;
@property (weak, nonatomic) IBOutlet UILabel *selectedreligionlabel;
@property (weak, nonatomic) IBOutlet UITextField *selectedreligiontextfield;

@property(nonatomic,strong) DBManager *dbManager;

- (IBAction)malebuttonclick:(id)sender;
- (IBAction)femalebuttonclick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *agetextfield;

@property (weak, nonatomic) IBOutlet UIButton *englishcheckbox;
- (IBAction)englishcheckboxclick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *hindicheckbox;
- (IBAction)hindicheckboxclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *frenchcheckbox;
- (IBAction)frenchcheckboxclick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *tamilcheckbox;
- (IBAction)tamilcheckboxclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *telugucheckbox;
- (IBAction)telugucheckboxclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *malayalamcheckbox;
- (IBAction)malayalamcheckboxclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *germancheckbox;
- (IBAction)germancheckboxclicked:(id)sender;
- (IBAction)submitbuttonclick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *resetButtonClick;
- (IBAction)resetButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *englishval;
@property (weak, nonatomic) IBOutlet UITextField *hindival;
@property (weak, nonatomic) IBOutlet UITextField *frenchval;
@property (weak, nonatomic) IBOutlet UITextField *tamilval;
@property (weak, nonatomic) IBOutlet UITextField *teluguval;
@property (weak, nonatomic) IBOutlet UITextField *malayalamval;
@property (weak, nonatomic) IBOutlet UITextField *germanval;
@property (weak, nonatomic) IBOutlet UITextField *maleval;
@property (weak, nonatomic) IBOutlet UITextField *femaleval;




@end
