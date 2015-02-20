//
//  Card.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Card.h"

@implementation Card 

-(void)addMember:(Member *)member{
    [members addObject:member];
}

-(NSMutableArray *): getMembers{
    return members;
}

-(NSMutableArray *)getComments{
    return comments;
}

-(void)addComment:(NSString *)comment{
    [comments addObject:comment];
}

@end
