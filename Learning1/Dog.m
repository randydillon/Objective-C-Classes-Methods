//
//  Dog.m
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import "Dog.h"

@implementation Dog

@synthesize hunger, age;

- (void)log {
    NSLog(@"This dog is %d years old",hunger);
}

@end
