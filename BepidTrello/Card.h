//
//  Card.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface Card : NSObject
{
    NSData *initDate;
    NSMutableArray *comments;
    NSMutableArray *members;
    
}

@property(getter=isArquived, setter=arquive:) BOOL *arquived;
@property NSString *detail;
@property NSData *dueDate;

-(void)addMember: (Member *)member;
-(void)addComment: (NSString *)comment;

-(NSMutableArray *): getMembers;
-(NSMutableArray *)getComments;

@end
