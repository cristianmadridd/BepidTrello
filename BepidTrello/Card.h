//
//  Card.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface Card : NSObject
@property NSString *description;
@property NSMutableArray *comments;
@property Member *cardMember;
@property NSData *date;

- (void)addMember:(Member *)cardMember;
- (void)addComent;


@end
