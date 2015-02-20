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

-(BOOL)isMember:(NSString *) username{
    BOOL ret = NO;
    
    if (members.count == 0){
        ret =  NO;
    }
    else {
        for (Member* m in members){
            if ([[m getUserName] isEqualToString:username])
                ret = YES;
            else
                ret = NO;
        }
        ret = NO;
    }
    return ret;
}
-(void) addMember: (Member *)member{
    [members addObject:member];
}

-(Member *)getMemberByUserName:(NSString *)username{
    Member *m = nil;
    
    if (members.count == 0)
        m = nil;
    
    for (m in members) {
        if ([[m getUserName] isEqualToString:username])
            break;
    }
    return m;
}

@end
