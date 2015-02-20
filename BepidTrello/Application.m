//
//  Application.m
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Application.h"
#import "Members.h"

@implementation Application

-(instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

-(void)session{
    Members *members = [[Members alloc] init];
    
    NSLog(@"Welcome to Trello");
    
    NSLog(@"1 - Log In");
    NSLog(@"2 - Sign Up");
    
    switch ([self readIntInputFromUser]){
        case 1:
            NSLog(@"Log In");
            NSLog(@"Log in with email and password");
            //[self verifyMemberByName:[self readStringInputFromUser:[NSCharacterSet newlineCharacterSet]]];
            if ([self verifyMemberByUsername:[self readStringInputFromUser]])
                // pass to next stage
            break;
        case 2:
            // do stuff
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


-(BOOL)verifyMemberByUsername: (NSString *)email{
    
    return NO;
}

@end