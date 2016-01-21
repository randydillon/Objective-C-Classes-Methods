//
//  Dog.h
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logging.h"

@interface Dog : NSObject <Logging> {
    
@private
    int hunger;
    int age;
}

@property int hunger;
@property int age;

@end
