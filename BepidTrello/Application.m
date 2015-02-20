//
//  Application.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Application.h"
#import "Member.h"

@implementation Application

-(instancetype)init{
    self = [super init];
    if(self){
        members = [[Members alloc] init];
    }
    return self;
}

-(void)session{
    NSLog(@"Welcome to Trello");
    
    NSLog(@"1 - Log In");
    NSLog(@"2 - Sign Up");
    
    NSString *username;
    NSString *password;
    
    switch ([self readIntInputFromUser]){
        case 1:
            NSLog(@"Log In");
            NSLog(@"Log in with email and password");
            NSLog(@"Insert email: ");
            //[self verifyMemberByName:[self readStringInputFromUser:[NSCharacterSet newlineCharacterSet]]];
            username = [self readStringInputFromUser];
            if ([self verifyMemberByUsername:username]) {
                NSLog(@"Insert password: ");
                password = [self readStringInputFromUser];
                if ([self loginWithUserName:username AndPassword:password]) {
                    // Session on
                    // Show the options
                }
                else {
                    NSLog(@"Invalid password");
                }
            }
            else {
                NSLog(@"Invalid username");
                }
            break;
        case 2:
            NSLog(@"Sign In");
            NSLog(@"Insert an email :");
            
            break;
        default:
            NSLog(@"Invalid input");
            [self session];
            break;
        
    }
}

-(int)readIntInputFromUser{
    int input;
    scanf("%d", &input);    
    return input;
}

-(NSString *)readStringInputFromUser{
    NSFileHandle * kdb = [NSFileHandle fileHandleWithStandardInput];
    NSData * inputData = [kdb availableData];
    NSString * input = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    return input;
}

/*
-(NSString *)readStringInputFromUser:(NSCharacterSet *)delimiters{
    NSMutableString * string = [NSMutableString string];
    unichar input = '\0';
    while (input != getchar()){
        if([delimiters characterIsMember:input]) { break; }
        [string appendFormat:@"%C", input];
    }
    NSLog(string);
    return string;
}
*/

-(BOOL)verifyMemberByUsername: (NSString *) username{
    BOOL ret = NO;
    
    if ([members isMember:username])
        ret = YES;
    return ret;
}

-(BOOL)loginWithUserName: (NSString *) username AndPassword: (NSString *) password{
    BOOL ret = NO;
    Member *member = [members getMemberByUserName:username];
    
    if ([[member getPassword] isEqualToString:password])
        ret = YES;

    return NO;
}

@end