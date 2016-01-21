//
//  Rectangle.h
//  Learning1
//
//  Created by Randy on 1/1/16.
//  Copyright © 2016 Randy Dillon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject <NSCoding> {
    int height;
    int width;
}

@property int height;
@property int width;

- (id)initWithHeight:(int)h;
- (id)initWithWidth:(int)w;
- (id)initWithHeight:(int)h width:(int)w;

@end
