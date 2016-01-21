//
//  Person.h
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logging.h"

@class Cookie;

@interface Person : NSObject <Logging> {
@private
    NSString *name;
    int age;
    Cookie *cookie;
}
@property (copy) NSString *name;
@property int age;
@property (retain) Cookie *cookie;

@end
