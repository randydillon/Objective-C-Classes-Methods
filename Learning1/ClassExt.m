//
//  ClassExt.m
//  Learning1
//
//  Created by Randy on 1/2/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "ClassExt.h"

@interface ClassExt () { // class extensions can be used to hide interfaces from the public interface
    NSString *str;
}
@property (readwrite, copy) NSString *name;
-(void)something;
@end

@implementation ClassExt

@synthesize name;

- (id) init {
    self = [super init];
    if (self) {
        str = @"Good";
    }
    return self;
}
- (void) log {
    [self setName:@"Bye"];
    NSLog(@"%@ %@",str,name);
}
- (void)something {
    
}
@end
