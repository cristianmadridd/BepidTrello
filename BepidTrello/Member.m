//
//  Member.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Member.h"

@implementation Member


-(NSString *)getUserName{
    return userName;
}

-(void)setUserName:(NSString *)theUserName{
    userName = theUserName;
}

-(NSString *)getPassword{
    return password;
}

-(void)setPassword:(NSString *)thePassword{
    password = thePassword;
}

@end
