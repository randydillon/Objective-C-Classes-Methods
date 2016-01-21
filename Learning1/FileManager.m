//
//  FileManager.m
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

// to create storage don't use methods in a singleton
static FileManager *defaultManager;

+ (void)initialize { // use initialize to create singleton : first method to be called, only will be called once, it is thread-safe
    static BOOL isInitialized = NO; // STATIC keeps state to prevent rare cases where the initialize could be called twice
    if (!isInitialized) {
        defaultManager = [[FileManager alloc] init];
        isInitialized = YES;
    }
}

+ (FileManager *)defaultManager {
    return defaultManager;
}

@end
