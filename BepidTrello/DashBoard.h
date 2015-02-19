//
//  DashBoard.h
//  BepidTrello
//
//  Created by Cristian Madrid on 2/19/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
#import "Board.h"
#import "Organization.h"

@interface DashBoard : NSObject

-(NSArray*) getOrganizations;

-(NSMutableArray *) getBoards;
-(BOOL *) addBoard: (Board *) board;
-(Member *) getMember;

@end
