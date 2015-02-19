//
//  DashBoard.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
<<<<<<< HEAD
#import "Member.h"
#import "Board.h"
#import "Organization.h"
=======
#import "Organization.h"

>>>>>>> origin/master

@interface DashBoard : NSObject {
    Organization *myOrganization;
}

-(NSArray*) getOrganizations;

-(NSMutableArray *) getBoards;
-(BOOL *) addBoard: (Board *) board;
-(Member *) getMember;

@end
