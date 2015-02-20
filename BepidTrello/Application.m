//
//  Application.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Application.h"

@implementation Application

-(instancetype)init{
    self = [super init];
    if(self){
        users = [[NSMutableArray alloc]init];
        
        NSLog(@"Welcome to trello");
    }
    return self;
}

-(void)addUser:(Member *)member{
    [users addObject:member];
}

-(BOOL *)loginWithUserName:(NSString *)userName AndPassword:(NSString *)password{
    Member *user = [self getUserByUserName:userName];
    if(!user){
        return NO;
    }
    return [[user getPassword] isEqualToString:password] ? YES : NO;
}

-(Member *)getUserByUserName: (NSString *) userName{
    for (Member *item in users) {
        if([[item getUserName] isEqualToString:userName]){
            return item;
        }
    }
    return nil;
}

@end