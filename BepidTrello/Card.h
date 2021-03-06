//
//  Card.h
//
//  BepidTrello
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/23/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Member;

@interface Card : NSObject
{
    NSMutableArray *comments;
    NSMutableArray *members;
}

@property(getter=isArquived) BOOL *arquived;
@property NSString *detail;
@property NSString *name;

-(void)addMember: (Member *)member;
-(void)addComment: (NSString *)comment;

-(NSMutableArray *)getMembers;
-(NSMutableArray *)getComments;

@end
