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
-(void) menu{
    
    Member *member = [[Member alloc]init];
    [self session];
    
    NSLog(@"1 - Create Board");
    
}

-(Member *)session{
    
    BOOL *verify = NO;
    
    while (!verify) {
        NSString *username;
        NSString *password;
        NSLog(@"1 - Log In");
        NSLog(@"2 - Sign Up");
        
        switch ([self readIntInputFromUser]){
            case 1:
                NSLog(@"Insert email: ");
                //[self verifyMemberByName:[self readStringInputFromUser:[NSCharacterSet newlineCharacterSet]]];
                username = [self readStringInputFromUser];
                if ([self verifyMemberByUsername:username]) {
                    NSLog(@"Insert password: ");
                    password = [self readStringInputFromUser];
                    if ([self loginWithUserName:username AndPassword:password]) {
                        return [members getMemberByUserName:username];
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
                return [self createMember];
                
                break;
            default:
                NSLog(@"Invalid input");
                [self session];
                break;
        }
    }
    return nil;
}

-(Member *)createMember{
    
    NSLog(@"###########################################################");
    
    NSLog(@"Insert the name:");
    NSString *name = [self readStringInputFromUser];
    
    NSLog(@"\nInsert the username:");
    NSString *username = [self readStringInputFromUser];
    
    NSLog(@"\nInsert the password:");
    NSString *password = [self readStringInputFromUser];
    
    Member *member = [[Member alloc]init];
    [member setName:name];
    [member setUserName:username];
    [member setPassword:password];

    [members addMember:member];
    return member;
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