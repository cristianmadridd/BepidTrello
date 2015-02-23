//
//  Members.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/23/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Member;

@interface Members : NSObject
{
    NSMutableArray *members;
}

-(BOOL)isMember:(NSString *) username;
-(Member *)getMemberByUserName:(NSString *)username;
-(void)addMember: (Member *)member;
-(NSMutableArray *)getMembers;

@end
