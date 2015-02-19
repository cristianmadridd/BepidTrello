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
    }
    return self;
}

-(void)addList:(NSArray *)list{
    
    
}
-(void)addMember:(Member *)member{
    
}

-(void)setVisibility:(Visibility)visibility{
    
}

-(void)setBackgroundColour:(Colour)colour{
    
}

@end
