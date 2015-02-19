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
    Card *cardList;
    
}

+ (void)addCard:(Card *)cardList;
+ (void)moveCard;
+ (void)archiveCard;
+ (void)archiveAllCards;


@end
