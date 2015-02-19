//
//  Organization.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface Organization : NSObject

@property NSMutableArray *boards;
@property NSMutableArray  *members;

-(BOOL *)addBoard:(Board *)board;
-(NSMutableArray *)getBoards;

-(BOOL *)addMember:(Member *)member;
-(NSMutableArray *)getMembers;


@end
