//
//  NSString-URLPerfixCheck.m
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import "NSString-URLPerfixCheck.h"

@implementation NSString (Utilities)

- (BOOL) isURLPrefix {
    if([self hasPrefix:@"http://"]) { return YES; }
    else { return NO; }
}

@end
