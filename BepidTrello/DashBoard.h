//
//  DashBoard.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
#import "Board.h"
#import "Organization.h"

@interface DashBoard : NSObject {
    NSMutableArray *organizations;
    NSMutableArray *boards;
    Member *member;
}

-(NSMutableArray*)getOrganizations;
-(Member *)getMember;
-(NSMutableArray *)getBoards;
-(void)addBoard: (Board *)board;

@end
