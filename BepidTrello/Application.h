//
//  Application.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface Application : NSObject{
    NSMutableArray *users;
}

-(BOOL *)loginWithUserName: (NSString *) userName AndPassword: (NSString *) password;
-(void)addUser: (Member *)member;

@end