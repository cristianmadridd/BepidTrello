//
//  List.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "List.h"
#import "Card.h"

@implementation List

-(instancetype)init{
    self = [super init];
    if(self){
        cards = [[NSMutableArray alloc]init];
        _arquived = NO;
    }
    return self;
}

-(NSMutableArray *)getCards{
    return cards;
}

-(void)removeCard:(Card *)card{
    [cards removeObject:card];
}

-(void)addCard: (Card *)card{
    [cards addObject:card];
}

@end
