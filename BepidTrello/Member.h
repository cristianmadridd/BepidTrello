//
//  Member.h
//  BepidTrello
//
//  Created by Alexandre Mantovani, Anderson Kloss, Cristian Madrid, Elisa Leo on 2/19/15.
//  Copyright (c) 2015 Trello Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject {
    NSString *name;
    NSString *userName;
}

+ (NSString *)getUserName;
+ (NSString *)getName;

@end
