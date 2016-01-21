//
//  MyClass.m
//  Learning1
//
//  Created by Randy on 12/30/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import "Person1.h"

@implementation Person1 : NSObject

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"hunger"]) {
//        NSLog(@"%@",[object valueForKeyPath:keyPath]);
        NSLog(@"%@",[change objectForKey:NSKeyValueChangeOldKey]);
    }
}

@end
