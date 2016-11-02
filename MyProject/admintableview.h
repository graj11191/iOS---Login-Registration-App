//
//  admintableview.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/19/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@interface admintableview : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (weak, nonatomic) IBOutlet UITableView *tableviewdisplay;
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *arrPeopleInfo;
- (IBAction)backbuttonclick:(id)sender;
-(void)loadData;

@end
