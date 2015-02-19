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

typedef NS_ENUM(NSInteger, Colour) {
    BLUE,
    YELLOW,
    WHITE,
    GREEN,
    BLACK,
    RED
};

@interface Board : NSObject

@property NSMutableArray *lists;
@property NSMutableArray *member;
@property Visibility visibility;
@property NSString *name;
@property Colour background;



-(void) addList: (NSArray *) list;
-(void) addMember: (Member *) member;
-(void) setName: (NSString *) name;
-(void) setBackgroundColour: (Colour) colour;
-(void) setVisibility: (Visibility) visibility;


@end
