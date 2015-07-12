//
//  DataModel.h
//  dresscode
//
//  Created by Ravi Prakash on 7/11/15.
//  Copyright (c) 2015 xpd54. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataModel : NSObject {
    NSString *databasePath;
}

+(DataModel *)sharedInstance;
-(BOOL)createDB;
-(BOOL) saveData:(NSString *)userId
           shirt:(NSString *)shirt
            pant:(NSString *)pant
        bookMark:(NSString *)bookMark;

-(NSArray*) findByUserId:(NSString*)userId;
@end