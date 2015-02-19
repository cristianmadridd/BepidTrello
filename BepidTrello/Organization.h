//
//  Organization.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface Organization : NSObject {
    Board *myBoard;

}

// @property

+ (void)createBoard:(Board *)myBoard;
+ (NSString *)getBoards;

@end