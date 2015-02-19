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
        _lists = [[NSMutableArray alloc]init];
        _members = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addList:(NSArray *)list{
    [_lists addObject:list ];
    
}
-(void)addMember:(Member *)member{
    [_members addObject:member];
}


-(void)setBackgroundColour:(Colour)colour{
    _background = colour;
}

@end
