//
//  Organization.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Organization.h"

@implementation Organization


-(NSMutableArray *) getBoards{
    return boards;
}

-(void)addBoard: (Board *)board{
    [boards addObject:board];
}

-(NSMutableArray *) getMembers{
    return members;
}

-(void)addMember: (Member *)member{
    [members addObject:member];
}

@end
