//
//  Board.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

typedef NS_ENUM(NSInteger, Visibility) {
    PUBLIC,
    PRIVATE,
    ORGANIZATION
};

typedef NS_ENUM(NSInteger, Color) {
    BLUE,
    YELLOW,
    WHITE,
    GREEN,
    BLACK,
    RED
};

@interface Board : NSObject{
    NSMutableArray *lists;
    NSMutableArray *members;
}

@property(getter=isArquived) BOOL *arquived;
@property Visibility visibility;
@property NSString *name;
@property Color background;

-(void) addList: (NSString *) listName;
-(void) addMember: (Member *) member;
-(void) moveCard: (Card *) card fromList:(List *) fList toList: (List *) tList;

@end
