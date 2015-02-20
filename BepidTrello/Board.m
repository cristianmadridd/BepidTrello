//
//  Board.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Board.h"

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

-(void)addList:(NSString *)listName{
    List *list = [[List alloc] init];
    list.name = listName;
    
    [lists addObject:list ];
}

-(void)addMember:(Member *)member{
    [members addObject:member];
}

-(void)moveCard:(Card *)card fromList:(List *)fList toList:(List *)tList{
    
}

@end
