//
//  DashBoard.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/23/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Board, Organization;

@interface DashBoard : NSObject {
    NSMutableArray *boards;
}
-(NSMutableArray *)getBoards;
-(void)addBoard: (Board *)board;

@end
