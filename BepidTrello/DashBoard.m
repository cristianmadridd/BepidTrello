//
//  DashBoard.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "DashBoard.h"
#import "Board.h"
#import "Organization.h"

@implementation DashBoard

-(instancetype)init{
    self = [super init];
    if(self){
        organizations = [[NSMutableArray alloc]init];
        boards = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addOrganization:(Organization *)organization{
    [organizations addObject:organization];
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

