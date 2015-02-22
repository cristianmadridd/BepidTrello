//
//  Application.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Member, Members;

@interface Application : NSObject{
     Members *members;
}

-(int)readIntInputFromUser;
//-(NSString *)readStringInputFromUser:(NSCharacterSet *)delimiters;
-(NSString *)readStringInputFromUser;
-(BOOL)loginWithUserName: (NSString *) userName AndPassword: (NSString *) password;

@end