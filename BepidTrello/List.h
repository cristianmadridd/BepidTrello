//
//  List.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface List : NSObject {
    NSMutableArray *cards;
}

@property(getter=isArquived, setter=arquive:) BOOL *arquived;
@property NSString *name;

-(void)removeCard: (Card *)card;
-(void)addCard: (Card *)card;
-(void)archiveAllCards;

@end
