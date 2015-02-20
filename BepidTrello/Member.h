//
//  Member.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DashBoard.h"

@interface Member : NSObject {
    DashBoard *dashBoard;
    NSString *userName;
    NSString *password;
}

@property NSString *name;

-(NSString *)getUserName;
-(NSString *)getPassword;
-(DashBoard *)getDashBoard;

-(void)setUserName: (NSString *)theUserName;
-(void)setPassword: (NSString *)thePassword;


@end
