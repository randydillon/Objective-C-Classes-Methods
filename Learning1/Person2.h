//
//  Person2.h
//  Learning1
//
//  Created by Randy on 1/4/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person2 : NSObject

@property (copy) NSString *name;
@property int age;

- (id)initWithName:(NSString *)name age:(int)age; // convienence initializer

@end
