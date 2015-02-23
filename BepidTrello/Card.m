//
//  Card.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/23/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Card.h"
#import "Member.h"

@implementation Card 

-(instancetype)init{
    self = [super init];
    if(self){
        comments = [[NSMutableArray alloc]init];
        members = [[NSMutableArray alloc]init];
        _arquived = NO;
    }
    return self;
}

-(void)addMember:(Member *)member{
    [members addObject:member];
}

-(NSMutableArray *)getMembers{
    return members;
}

-(NSMutableArray *)getComments{
    return comments;
}

-(void)addComment:(NSString *)comment{
    [comments addObject:comment];
}

@end
