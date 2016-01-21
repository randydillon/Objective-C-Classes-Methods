//
//  MyBlocks.m
//  Learning1
//
//  Created by Randy on 1/14/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "MyBlocks.h"

@implementation MyBlocks


typedef int (*print_function1)(char *arg);
typedef int (^print_block1)(char *arg);

// inline blocks
int (^print_block2)(char *arg);

//print_block2 = ^(char *arg) {
//    NSLog(@"%s",arg);
//    return 0;
//};

print_block1 pb = ^(char *arg) {
    NSLog(@"%s",arg);
    return 0;
};

- (void) simpleMethod {
    pb("HEllo");
}

@end
