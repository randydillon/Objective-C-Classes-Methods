//
//  JediTemple.m
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "JediTemple.h"

@interface JediTemple ()
@property (readonly) NSArray *jedi;
@end

@implementation JediTemple

- (id) init
{
    self = [super init];
    if (self) { // as long as memory exists, declare the array jedi
        _jedi = @[@"Mace",@"Luke",@"Obi-Wan",@"Yoda",@"Anakin"];
    }
    return self;
}

- (void)enumerateMembersWithBlock:(void (^)(NSString *, int, BOOL *))block {
    BOOL stop = NO;
    for (int i = 0; i < [_jedi count]; i++) {
        block(_jedi[i], i, &stop);
        if (stop == YES) {
            return;
        }
    }
}

@end
