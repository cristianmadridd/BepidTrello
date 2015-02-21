//
//  Application.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Application.h"
#import "Member.h"
#import "Members.h"
#import "DashBoard.h"
#import "Board.h"

@implementation Application

Member *loggedMember;

-(instancetype)init{
    self = [super init];
    if(self){
        members = [[Members alloc] init];
        [self masterMenu];
        [self dashBoardMenu];
        
    }
    return self;
}

-(void)masterMenu{
    
    loggedMember = [[Member alloc]init];
    BOOL *aux = NO;
    
    
    while (!aux) {
        NSLog(@"1 - Log In");
        NSLog(@"2 - Sign Up");
        
        switch ([self readIntInputFromUser]) {
            case 1: {
                
                loggedMember = [self login];
                if(loggedMember){
                    aux = YES;
                }
            }
                break;
            case 2: {
                
                loggedMember = [self createMember];
                if (loggedMember) {
                    aux = YES;
                }
                
            }
                break;
            default:{
                NSLog(@"Fail");
            }
                break;
        }
    }
    
}

-(void)dashBoardMenu{
    
    DashBoard *dashBoard = [loggedMember getDashBoard];
    BOOL *aux = NO;
    
    NSLog(@"0 - Sair");
    for (int i=0; i < [dashBoard getBoards].count;i++){
        Board *it  = [[dashBoard getBoards] objectAtIndex:i];
        
        NSLog(@"%d - %@", i, [it name]);
    }
    
    int choice = [self readIntInputFromUser];
    if(choice == 0){
        [self createBoard];
    }
    else{
        [self boardMenu:[[dashBoard getBoards] objectAtIndex:choice]];
    }
}

-(void)boardMenu: (Board *)board{
    
}

-(void)listMenu:(List *)list{
    
}

-(void)cardMenu: (Card *)card{
    
}

-(Member *)login{
    
    NSString *userName;
    NSString *password;
    
    NSLog(@"Informe o userName:");
    userName = [self readStringInputFromUser];
    
    if(![members isMember :userName]){
        NSLog(@"Usuário inexistente");
        return nil;
    }
    
    NSLog(@"Informe o password:");
    password = [self readStringInputFromUser];
    
    if([self loginWithUserName:userName AndPassword:password]){
        return [members getMemberByUserName:userName];
    }
    return nil;
}

#pragma mark Creates

-(void)createBoard{
    NSLog(@"##################### NEW BOARD #############################");
    
    NSLog(@"\n Insert the Board name:");
    NSString *name = [self readStringInputFromUser];
    
    Board *board = [[Board alloc]init];
    [board setName:name];
    
    [[loggedMember getDashBoard] addBoard:board];
}

-(Member *)createMember{
    
    NSLog(@"##################### NEW USER #############################");
    
    NSLog(@"\n Insert the Name:");
    NSString *name = [self readStringInputFromUser];
    
    NSLog(@"\nInsert the UserName:");
    NSString *username = [self readStringInputFromUser];
    
    NSLog(@"\nInsert the Password:");
    NSString *password = [self readStringInputFromUser];
    
    Member *member = [[Member alloc]init];
    [member setName:name];
    [member setUserName:username];
    [member setPassword:password];

    [members addMember:member];
    
    return member;
}

-(BOOL)loginWithUserName: (NSString *) username AndPassword: (NSString *) password{
    
    Member *member = [members getMemberByUserName:username];
    return ([[member getPassword] isEqualToString:password]);
}

#pragma mark Helpers

-(int)readIntInputFromUser{
    int input;
    scanf("%d", &input);
    while(getchar() != '\n');
    return input;
}

-(NSString *)readStringInputFromUser{
    NSFileHandle * kdb = [NSFileHandle fileHandleWithStandardInput];
    NSData * inputData = [kdb availableData];
    return [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
}

@end