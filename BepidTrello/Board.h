//
//  Board.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, Visibility) {
    PUBLIC,
    PRIVATE,
    ORGANIZATION
};

@class Member, Card, List;
@interface Board : NSObject{
    NSMutableArray *lists;
    NSMutableArray *members;
}

@property Visibility visibility;
@property NSString *name;

-(NSMutableArray *) getLists;
-(void) addList: (List *) list;
-(void) addMember: (Member *) member;
-(void) removeMember:(Member *)member;
-(NSMutableArray *) getMembers;

@end
