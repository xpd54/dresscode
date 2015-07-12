//
//  DataModel.m
//  dresscode
//
//  Created by Ravi Prakash on 7/11/15.
//  Copyright (c) 2015 xpd54. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
static DataModel *instance;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;


+ (DataModel *) sharedInstance {
    if(instance) {
        return instance;
    }
    
    instance = [[DataModel alloc] init];
    [instance createDB];
    return instance;
}

-(BOOL) createDB {
    NSString *docsDir;
    NSArray *dirPaths;
    // DocumentDirectory path
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    // path to database file
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent: @"dress.db"]];
    BOOL isSuccessful = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "create table if not exists userDetail (userId text primary key, shirt text, pant text, bookMark text)";
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccessful = NO;
                NSLog(@"table does not get created");
            }
            
            const char *sql_bookmark_stmt = "create table if not exists bookmark (id integer primary key autoincrement, userId text, shirt text, pant text)";
            if (sqlite3_exec(database, sql_bookmark_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                isSuccessful = NO;
                NSLog(@"bookmark table does not get created");
            }
            
            sqlite3_close(database);
            return  isSuccessful;
        }
        else {
            isSuccessful = NO;
            NSLog(@"database does not get open");
        }
    }
    return isSuccessful;
}

- (BOOL) saveData:(NSString *)userId
            shirt:(NSString *)shirt
             pant:(NSString *)pant
         bookMark:(NSString *)bookMark {
    
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into userDetail (userId, shirt, pant, bookMark) values (\"%@\",\"%@\", \"%@\", \"%@\")",
                               userId,
                               shirt,
                               pant,
                               bookMark];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}

- (NSArray*) findByUserId:(NSString*)userId {
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"select shirt, pant, bookMark from userDetail where userId=\"%@\"",userId];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *shirt = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:shirt];
                NSString *pant = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:pant];
                NSString *bookMark = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:bookMark];
                return resultArray;
            }
            else {
                NSLog(@"Not found");
                return nil;
            }
        }
    }
    return nil;
}

@end
