//
//  DBManager.h
//  MyProject
//
//  Created by Ayyapparaj, Gautham Raj on 10/17/16.
//  Copyright © 2016 Ayyapparaj, Gautham Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DBManager.h"

@interface DBManager : NSObject

-(instancetype)initWithDatabaseFilename : (NSString *)dbFilename;

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;
@property (nonatomic, strong) NSMutableArray *arrResults;
@property (nonatomic, strong) NSMutableArray *arrColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;


-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;
-(void)copyDatabaseIntoDocumentsDirectory;

-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;

@end
