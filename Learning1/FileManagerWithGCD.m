//
//  FileManagerWithGCD.m
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "FileManagerWithGCD.h"

@implementation FileManagerWithGCD

+ (FileManagerWithGCD *)defaultManager {
    static FileManagerWithGCD *defaultManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ // thread-safe, only called once
        defaultManager = [[FileManagerWithGCD alloc] init];
    });
    return defaultManager;
}

@end
