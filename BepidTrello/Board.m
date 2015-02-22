//
//  Board.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Board.h"
#import "List.h"
#import "Member.h"

@implementation Board

- (instancetype)init
{
    self = [super init];
    if (self) {
        lists = [[NSMutableArray alloc]init];
        members = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addList:(List *)list{
    [lists addObject:list];
}

-(void)addMember:(Member *)member{
    [members addObject:member];
}

-(void)removeMember:(Member *)member{
    [members removeObject:member];
}

-(NSMutableArray *)getLists{
    return lists;
}

-(NSMutableArray *)getMembers{
    return members;
}

@end
