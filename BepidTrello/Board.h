//
//  Board.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

typedef NS_ENUM(NSInteger, AMGMonth) {
    AMGMonthJanuary = 1
};

@interface Board : NSObject {
    NSString *name;
    List *list;
    NSInteger* visibility;
    ///AMGMonth a;
    AMGMonth a;
    
    
}



-(void) setVisibility: (AMGMonth*)vis;

//+ (void)createBoard:(Board *)myBoard;
//+ (NSString *)getBoards;
@end
