//
//  List.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "List.h"

@implementation List

-(NSMutableArray *)getCards{
    return cards;
}

-(void)removeCard:(Card *)card{
    [cards removeObject:card];
}

-(void)addCard: (Card *)card{
    [cards addObject:card];
}

-(void)archiveAllCards {
    for (Card *card in cards) {
        *card.arquived = YES;
    }
}

@end
