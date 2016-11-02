//
//  admintableview.m
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/19/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import "admintableview.h"
#import "DBManager.h"

@implementation admintableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrPeopleInfo.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //assigining delegates
    self.tableviewdisplay.delegate = self;
    self.tableviewdisplay.dataSource =self;

    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"DB.sql"];
    [self loadData];
}

- (IBAction)backbuttonclick:(id)sender {
    
}

-(void)loadData{
    //function to load data from the DB
    NSString *query = @"select * from userdetails";
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    [self.tableviewdisplay reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    NSInteger indexofusername = [self.dbManager.arrColumnNames indexOfObject:@"username"];
    NSInteger indexoffathername = [self.dbManager.arrColumnNames indexOfObject:@"fathername"];
    NSInteger indexofage = [self.dbManager.arrColumnNames indexOfObject:@"age"];
    NSInteger indexofreligion = [self.dbManager.arrColumnNames indexOfObject:@"religion"];
    NSInteger indexofmale = [self.dbManager.arrColumnNames indexOfObject:@"male"];
    NSInteger indexoffemale = [self.dbManager.arrColumnNames indexOfObject:@"female"];
    NSInteger indexofemailID = [self.dbManager.arrColumnNames indexOfObject:@"emailid"];
    NSInteger indexofpassword = [self.dbManager.arrColumnNames indexOfObject:@"password"];
    NSInteger indexofconfirmpassword = [self.dbManager.arrColumnNames indexOfObject:@"confirmpassword"];
    NSInteger indexofenglish = [self.dbManager.arrColumnNames indexOfObject:@"english"];
    NSInteger indexofhindi = [self.dbManager.arrColumnNames indexOfObject:@"hindi"];
    NSInteger indexoffrench = [self.dbManager.arrColumnNames indexOfObject:@"french"];
    NSInteger indexoftamil = [self.dbManager.arrColumnNames indexOfObject:@"tamil"];
    NSInteger indexoftelugu = [self.dbManager.arrColumnNames indexOfObject:@"telugu"];
    NSInteger indexofmalayalam = [self.dbManager.arrColumnNames indexOfObject:@"malayalam"];
    NSInteger indexofgerman = [self.dbManager.arrColumnNames indexOfObject:@"german"];
    
    //assigning the loaded values to the cell
    cell.textLabel.text = [NSString stringWithFormat:@"Name:%@ \nFather's Name: %@ \nAge: %@ Religion: %@ Sex: %@ %@ \nEmail ID: %@ Password: %@ \nLanguages known:%@ %@ %@ %@ %@ %@ %@",
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofusername],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexoffathername],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofage],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofreligion],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofmale],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexoffemale],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofemailID],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofpassword],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofenglish],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofhindi],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexoffrench],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexoftamil],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexoftelugu],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofmalayalam],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofgerman]];
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"Name: %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexofusername]];
    return cell;
}
@end
