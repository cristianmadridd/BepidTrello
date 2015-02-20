//
//  Application.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
#import "Members.h"

@interface Application : NSObject{
     Members *members;
}

-(void)session;
-(int)readIntInputFromUser;
//-(NSString *)readStringInputFromUser:(NSCharacterSet *)delimiters;
-(NSString *)readStringInputFromUser;
-(BOOL)verifyMemberByUsername: (NSString *)username;
-(BOOL *)loginWithUserName: (NSString *) userName AndPassword: (NSString *) password;

@end