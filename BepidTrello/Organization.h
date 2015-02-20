//
//  Organization.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "Member.h"

@interface Organization : NSObject
{
    NSMutableArray *boards;
    NSMutableArray  *members;
}

@property NSString *name;

-(void)addBoard: (Board *)board;
-(NSMutableArray *)getBoards;
-(void)addMember: (Member *)member;
-(NSMutableArray *)getMembers;

@end
