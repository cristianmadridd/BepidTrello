//
//  DashBoard.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "DashBoard.h"

@implementation DashBoard

-(instancetype)init{
    self = [super init];
    if(self){
        organizations = [[NSMutableArray alloc]init];
        boards = [[NSMutableArray alloc]init];
        member = [[Member alloc]init];
    }
    return self;
}

-(Member *)getMember{
    return member;
}

-(NSMutableArray *)getOrganizations{
    return organizations;
}

-(void)addBoard: (Board *)board{
    [boards addObject:board];
}

-(NSMutableArray *)getBoards{
    return boards;
}

@end

