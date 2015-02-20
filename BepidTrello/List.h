//
//  List.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface List : NSObject {
    NSMutableArray *cards;
}

@property(getter=isArquived) BOOL *arquived;
@property NSString *name;

-(NSMutableArray *)getCards;
-(void)removeCard: (Card *)card;
-(void)addCard: (Card *)card;
-(void)archiveAllCards;

@end
