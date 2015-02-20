//
//  Members.m
//  BepidTrello
//
//  Created by Anderson  Kloss Maia on 20/02/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import "Members.h"
#import "Member.h"

@implementation Members

-(instancetype)init{
    self = [super init];
    if(self){
        members = [[NSMutableArray alloc] init];
    }
    return self;
}

-(BOOL)isMember:(NSString *) username{
    for(Member* m in members){
    }
    
    return NO;
}

@end
