//
//  Members.h
//  BepidTrello
//
//  Created by Anderson  Kloss Maia on 20/02/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"

@interface Members : NSObject
{
    NSMutableArray *members;
}

-(BOOL)isMember:(NSString *) username;
-(Member *)getMemberByUserName:(NSString *) username;

@end
