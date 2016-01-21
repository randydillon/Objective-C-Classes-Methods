//
//  Person2.m
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "Person2.h"

@implementation Person2

- (id)initWithName:(NSString *)name age:(int)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ is %d years old",_name,_age];
}

@end
