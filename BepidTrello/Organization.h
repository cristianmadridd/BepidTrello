//
//  Organization.h
//  BepidTrello
//
//  Created by Cristian Madrid on 2/19/15.
//  Copyright (c) 2015 Cristian Madrid. All rights reserved.
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
