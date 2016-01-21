//
//  JediTemple.h
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JediTemple : NSObject

- (void)enumerateMembersWithBlock:(void (^)(NSString *name, int index, BOOL *stop))block;

@end
