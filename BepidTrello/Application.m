//
//  Application.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#include <stdlib.h>
#import "Application.h"
#import "Member.h"
#import "Members.h"
#import "DashBoard.h"
#import "Board.h"
#import "List.h"
#import "Card.h"

@implementation Application

Member *loggedMember;

-(instancetype)init{
    self = [super init];
    if(self){
        members = [[Members alloc] init];
        [self masterMenu];
        
    }
    return self;
}

#pragma mark Menu

-(void)masterMenu{
    
    printf("\n##################### Welcome to Trello #############################\n");
    
    loggedMember = nil;
    BOOL *aux = NO;
    
    
    while (!aux) {
        if(loggedMember){
            [self dashBoardMenu];
        }
        printf("[C]lose");
        printf("\n[L]og In");
        printf("\n[S]ign Up\n");
                
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            loggedMember = nil;
            break;
        }
        if([choice isEqualToString:@"L"]){
            loggedMember = [self login];
            if (loggedMember) {
                [self dashBoardMenu];
            }
        }
        else if([choice isEqualToString:@"S"]){
            loggedMember = [self createMember];
            [self dashBoardMenu];
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
    }
    
}

-(void)dashBoardMenu{
    
    BOOL *aux = NO;
    
    while (!aux) {
        
        printf("\n################ DASHBOARD OF %s ################", [[[loggedMember getUserName] uppercaseString] UTF8String]);
        printf("\n[L]ogout");
        printf("\n[N]ew Board");
        
        printf("\n----- Boards -----\n");
        NSMutableArray *boards = [self getAllBoardsOfMember:loggedMember];
        
        
        for (int i=0; i < boards.count;i++){
            printf("[%d] - %s\n", i, [[[boards objectAtIndex:i] name] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"L"]){
            loggedMember = nil;
            break;
        }
        else if([choice isEqualToString:@"N"]){
            [self createBoard];
        }
        else if([self isInteger:choice]){
            int indexOfBoard = [choice intValue];
            if(indexOfBoard >=  boards.count){
                printf("\n!!!!! Invalid !!!!!");
            }
            else{
                [self boardMenu:[boards objectAtIndex:indexOfBoard]];
            }
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
    }
}

-(void)boardMenu: (Board *)board{
    
    BOOL *aux = NO;
    
    while (!aux) {
        
        printf("\n##################### BOARD %s #############################", [[board name] UTF8String]);
        printf("\n[C]lose");
        printf("\n[M]embers");
        printf("\n[N]ew list");
        printf("\n----- Lists -----\n");
        
        for (int i=0; i < [board getLists].count; i++) {
            printf("[%d] - %s\n", i, [[[[board getLists] objectAtIndex:i] name] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"M"]){
            [self membersBoardMenu: board];
        }
        else if([choice isEqualToString:@"N"]){
            [self createList: board];
        }
        else if([choice isEqualToString:@"A"]){
            [self createList: board];
        }
        else if([self isInteger:choice]){
            
            int indexOfList = [choice intValue];
            if(indexOfList >=  [board getLists].count){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else{
                [self listMenu: [[board getLists] objectAtIndex:indexOfList]];
            }
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
    }
}

-(void)membersBoardMenu:(Board *)board{
    
    printf("\n##################### MEMBERS OF BOARD #############################");
    
    BOOL *aux = NO;
    
    while (!aux) {
        printf("\n[C]lose");
        printf("\n[A]dd");
        printf("\n[R]emove");
        printf("\n----- Members -----\n");
        
        for (int i=0; i < [board getMembers].count; i++) {
            printf("[%i] - %s\n", i, [[[[board getMembers] objectAtIndex:i] getUserName] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"A"]){
            [self addMemberToBoard:board];
        }
        else if([choice isEqualToString:@"R"]){
            
            if([board getMembers].count == 0){
                printf("\nThe board has no members");
                continue;
            }
            BOOL *auxIsInteger = NO;
            do{
                printf("\nPlease insert the index of member: ");
                NSString *memberIndex = [self readStringInputFromUser];
                if(![self isInteger:memberIndex]){
                    printf("\n!!!!! Invalid !!!!!\n");
                    break;
                }
                if([memberIndex intValue]>= [board getMembers].count){
                    continue;
                }
                if([memberIndex intValue] == 0){
                    printf("Its not possible remove the owner of board\n");
                    break;
                }
                [[board getMembers] removeObjectAtIndex:[memberIndex intValue]];
                break;
                
            }
            while (!auxIsInteger);
            
            
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
        
    }
}

-(void)listMenu:(List *)list{
    BOOL *aux = NO;
    
    while (!aux) {
        
        printf("\n##################### LIST %s #############################", [[list name] UTF8String]);
        printf("\n[C]lose");
        printf("\n[N]ew card");
        printf("\n----- Cards -----\n");
        
        for (int i=0; i < [list getCards].count; i++) {
            Card *item = [[list getCards] objectAtIndex:i];
            printf("[%d] - %s\n", i, [[item name] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"N"]){
            [self createCard: list];
        }
        else if([self isInteger:choice]){
            
            int indexOfCard = [choice intValue];
            if(indexOfCard >=  [list getCards].count){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else{
                [self cardMenu: [[list getCards] objectAtIndex:indexOfCard]];
            }
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
    }
}

-(void)cardMenu: (Card *)card{
    printf("\n##################### %s #############################", [[[card name] uppercaseString] UTF8String]);
    
    BOOL *aux = NO;
    
    while (!aux) {
        
        printf("\n[C]lose");
        printf("\n[N]ame: %s", [[card name] UTF8String]);
        printf("\n[D]etail: %s", [[card detail] UTF8String]);
        printf("\n[M]embers(%lu)", (unsigned long)[[card getMembers] count]);
        printf("\n[CO]mments(%lu)", (unsigned long)[[card getComments] count]);
        
        printf("\n");
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"N"]){
            printf("Insert the Card name: ");
            [card setName:[self readStringInputFromUser]];
        }
        else if([choice isEqualToString:@"D"]){
            printf("Insert the detail: ");
            [card setDetail:[self readStringInputFromUser]];
        }
        else if([choice isEqualToString:@"DD"]){

        }
        else if([choice isEqualToString:@"M"]){
            [self membersCardMenu:[card getMembers]];
        }
        else if([choice isEqualToString:@"CO"]){
            [self commentsCardMenu:[card getComments]];
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
    }
}

-(void)membersCardMenu:(NSMutableArray *)membersOfCard{
    
    printf("\n##################### ADD MEMBER TO CARD #############################");
    
    BOOL *aux = NO;
    
    while (!aux) {
        printf("\n[C]lose");
        printf("\n[A]dd");
        printf("\n[R]emove");
        printf("\n----- Members -----\n");
        
        for (int i=0; i < membersOfCard.count; i++) {
            printf("[%i] - %s\n", i, [[membersOfCard objectAtIndex:i] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"A"]){
            [self addMemberToCard:membersOfCard];
        }
        else if([choice isEqualToString:@"R"]){
            
            printf("\nPlease insert the index of member: ");
            NSString *memberIndex = [self readStringInputFromUser];
            if(![self isInteger:memberIndex]){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else if([memberIndex intValue]>= membersOfCard.count){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else{
                [membersOfCard removeObjectAtIndex:[memberIndex intValue]];
            }
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
        
    }
}

-(void)commentsCardMenu:(NSMutableArray *)commentsOfCard{
    
    printf("\n##################### ADD COMMENT #############################");
    
    BOOL *aux = NO;
    
    while (!aux) {
        printf("\n[C]lose");
        printf("\n[A]dd");
        printf("\n[R]emove");
        printf("\n----- Comments -----\n");
        
        for (int i=0; i < commentsOfCard.count; i++) {
            printf("[%i] - %s\n", i, [[commentsOfCard objectAtIndex:i] UTF8String]);
        }
        
        NSString *choice = [[self readStringInputFromUser] uppercaseString];
        
        if([choice isEqualToString:@"C"]){
            break;
        }
        else if([choice isEqualToString:@"A"]){
            [self addCommentsToCard:commentsOfCard];
        }
        else if([choice isEqualToString:@"R"]){
            
            printf("\nPlease insert the index of comment: ");
            NSString *commentIndex = [self readStringInputFromUser];
            if(![self isInteger:commentIndex]){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else if([commentIndex intValue]>= commentsOfCard.count){
                printf("\n!!!!! Invalid !!!!!\n");
            }
            else{
                [commentsOfCard removeObjectAtIndex:[commentIndex intValue]];
            }
            
        }
        else{
            printf("\n!!!!! Invalid !!!!!\n");
        }
        
    }
}

#pragma mark Creates

-(void)addMemberToCard:(NSMutableArray *)membersOfCard{
    
    BOOL *aux = NO;
    
    do{
        printf("\nInsert the userName: ");
        NSString *userName = [self readStringInputFromUser];
        if ([members isMember:userName]) {
            
            if (membersOfCard.count == 0) {
                [membersOfCard addObject:userName];
                break;
            }
            else{
                for (int i=0;i< membersOfCard.count;i++) {
                    if([[membersOfCard objectAtIndex:i] isEqualToString:userName]){
                        break;
                    }
                    if (i == membersOfCard.count-1) {
                        [membersOfCard addObject:userName];
                        aux = YES;
                        break;
                    }
                }
                 printf("\n!!!!! Member already added!!!!!");
                 break;
            }
        }
        else{
            printf("\n!!!!! Invalid username!!!!!");
            break;
        }
    }
    while(!aux);
}

-(void)addCommentsToCard:(NSMutableArray *)commentsOfCard{
    printf("\nInsert the comment: ");
    [commentsOfCard addObject:[self readStringInputFromUser]];
}

-(void)createCard: (List *)list{
    printf("\n\n##################### NEW CARD #############################");
    
    printf("\nInsert the Card name: ");
    NSString *name = [self readStringInputFromUser];
    
    Card *card = [[Card alloc]init];
    [card setName:name];
    
    [list addCard:card];
}

-(void)createList: (Board *)board{
    printf("\n##################### NEW LIST #############################");
    
    printf("\nInsert the List name: ");
    NSString *name = [self readStringInputFromUser];
    
    List *list = [[List alloc]init];
    [list setName:name];
    
    [board addList:list];
}

-(void)addMemberToBoard:(Board *)board {
    
    BOOL *aux = NO;
    NSString *userName;

    do{
        
        printf("\nInsert the userName: ");
        userName = [self readStringInputFromUser];
        if([members isMember:userName]){
            break;
        }
        printf("\n!!!!! Invalid User !!!!!\n");
    }
    while (!aux);
    
    for (int i = 1; i < [board getMembers].count; i++) {
        if ([[[[board getMembers] objectAtIndex:i] getUserName] isEqualToString:userName]) {
            break;
        }
        if ( i == [board getMembers].count -1) {
            [board addMember:[members getMemberByUserName:userName]];
            return;
        }
    }
    
    if ([board getMembers].count == 1) {
        [board addMember:[members getMemberByUserName:userName]];
        return;
    }
    
    for (int i=1; i < [board getMembers].count; i++) {
        Member *m = [[board getMembers] objectAtIndex:i];
        if(![[ m getUserName] isEqualToString:userName]){
            continue;
        }
        if (i == [board getMembers].count - 1) {
            [board addMember:[members getMemberByUserName:userName]];
        }
    }
}

-(void)removeMemberFromBoard:(Board *)board {
    
    BOOL *aux = NO;
    NSString *choice;
    
    do{
        
        printf("\nInsert the userName: ");
        
        if([self isInteger:choice]){
            int indexOfUser = [choice intValue];
            
            if(indexOfUser == 0){
                printf("\n!!!!! It's not possible remove the Owner of Board!!!!!\n");
            }
            else if(indexOfUser >= [board getMembers].count){
                printf("\n!!!!! Invalid !!!!!");
            }
            else{
                [[board getMembers] removeObjectAtIndex:indexOfUser];
            }
        }
        printf("\n!!!!! Invalid User !!!!!\n");
    }
    while (!aux);
}

-(void)createBoard{
    printf("\n##################### NEW BOARD #############################");
    
    printf("\nInsert the Board name: ");
    NSString *name = [self readStringInputFromUser];
    
    Board *board = [[Board alloc]init];
    [board setName:name];
    [board addMember:loggedMember];
    
    [[loggedMember getDashBoard] addBoard:board];
}

-(Member *)createMember{
    
    printf("\n##################### NEW MEMBER #############################");
    
    Member *member = [[Member alloc]init];
    printf("\nInsert the Name: ");
    
    NSString *name = [self readStringInputFromUser];
    [member setName:name];
    
    BOOL *aux = NO;
    while (!aux) {
        printf("Insert the UserName: ");
        NSString *username = [self readStringInputFromUser];
        if([members isMember:username]){
            printf("\n!!!!! UserName already exists! !!!!!\n");
            continue;
        }
        [member setUserName:username];
        break;
    }
    
    printf("Insert the Password: ");
    NSString *password = [self readStringInputFromUser];
    [member setPassword:password];
    
    [members addMember:member];
    
    return member;
}



#pragma mark Helpers

-(BOOL)loginWithUserName: (NSString *) username AndPassword: (NSString *) password{
    
    Member *member = [members getMemberByUserName:username];
    return ([[member getPassword] isEqualToString:password]);
}

-(Member *)login{
    
    NSString *userName;
    NSString *password;
    
    printf("Insert the userName: ");
    userName = [self readStringInputFromUser];
    
    if(![members isMember :userName]){
        printf("\n!!!!! Invalid User !!!!!\n");
        return nil;
    }
    
    printf("Insert the password: ");
    password = [self readStringInputFromUser];
    
    if([self loginWithUserName:userName AndPassword:password]){
        return [members getMemberByUserName:userName];
    }
    return nil;
}

-(int)readIntInputFromUser{
    int input;
    scanf("%d", &input);
    while(getchar() != '\n');
    return input;
}

-(NSString *)readStringInputFromUser{
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [input availableData];
    NSString *inputString = [[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding];
    return[inputString stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
}

-(NSMutableArray *)getAllBoardsOfMember:(Member *)member{
    
    NSMutableArray *boards = [[member getDashBoard] getBoards];
    for (Member *el in [members getMembers]) {
        if([[el getUserName] isEqualToString:[member getUserName]]){
            continue;
        }
        
        for (Board *board in [[el getDashBoard] getBoards]) {
            BOOL *exists = NO;
            for (Board *b in boards){
                if ([board isEqualTo:b]) {
                    exists = YES;
                }
            }
            if(exists == YES)
                continue;
            for (int i=1; i < [board getMembers].count; i++) {
                if ([[board getMembers] objectAtIndex:i] == member) {
                    
                    [boards addObject:board];
                }
            }
        }
    }
    return boards;
}

-(BOOL *)isInteger:(NSString *)value{
    return !([value rangeOfCharacterFromSet:
              [[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound);
}

@end