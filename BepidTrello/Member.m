//
//  Member.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Member.h"
#import "DashBoard.h"

@implementation Member

-(instancetype)init{
    self = [super init];
    if(self){
        [self createDashBoard];
    }
    return self;
}

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

-(DashBoard *)getDashBoard{
    return dashBoard;
}

-(void)createDashBoard{
    dashBoard = [[DashBoard alloc]init];
}

@end
