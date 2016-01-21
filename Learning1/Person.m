//
//  Person.m
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import "Person.h"
#import "Cookie.h"

@implementation Person

@synthesize age, name;
@synthesize cookie;

- (id) init
{
    self = [super init];
    if (self) {
        name = @"Yoda";
        age = 6;
        cookie = [[Cookie alloc] init];
    }
    return self;
}

// Define the Protocol method : Log
- (void)log {
    NSLog(@"%@ is %d years old",name,age);
}

@end
