//
//  Members.m
//  BepidTrello
//
//  Created by Anderson  Kloss Maia on 20/02/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Members.h"
#import "Member.h"

@implementation Members

-(instancetype)init{
    self = [super init];
    if(self){
        members = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray *)getMembers{
    return members;
}

-(BOOL)isMember:(NSString *) userName{
    
    for (Member *member in members){
        if ([[member getUserName] isEqualToString:userName]) {
            return YES;
        }
    }
    return NO;
}

-(void) addMember: (Member *)member{
    [members addObject:member];
}

-(Member *)getMemberByUserName:(NSString *)userName{
    
    for (Member *member in members) {
        if ([[member getUserName] isEqualToString:userName]){
            return member;
        }
    }
    
    return nil;
}

@end
