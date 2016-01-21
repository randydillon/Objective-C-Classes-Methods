//
//  ViewController.m
//  Learning1
//
//  Created by Randy on 12/28/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidLoad");

    [self doBlockStuff];
}

- (void) doBlockStuff {
    MyBlocks* new1 = [[MyBlocks alloc] init];
    [new1 simpleMethod];
//    [MyBlocks simpleMethod];
}

- (void) doSingletonExamples0 {
    NSLog(@"%@",[FileManager defaultManager]);
    NSLog(@"%@",[FileManager defaultManager]);
}

- (void) doSingletonExamples1 {
    [NSUserDefaults standardUserDefaults];
    [NSFileManager defaultManager];
    [NSNotificationCenter defaultCenter];
    [NSNotificationQueue defaultQueue];
    NSLog(@"");
}

- (void) doBlockWithMedhodsClass {
    JediTemple *temple = [[JediTemple alloc] init];
    [temple enumerateMembersWithBlock:^(NSString *name, int index, BOOL *stop) {
        if ([name isEqualToString:@"Yoda"]) {
            NSLog(@"Here's Yoda!");
            *stop = YES;
        } else {
            NSLog(@"%@ is not Yoda.",name);
        }
    }];
}
- (void) doBlockWithMethods1 {
    
    __block int num = 7; // belongs to a block and can change within the block of type void, whereas a regular variable cannot without a return type
    
    int (^square)(void) = ^ {
        return num * num;
    };
    num = 20;
    
    NSLog(@"%d",square());
}

- (void) doSortDescriptorExamples {
    Person2 *person1 = [[Person2 alloc] initWithName:@"Lucas" age:18];
    Person2 *person2 = [[Person2 alloc] initWithName:@"Yoda" age:900];
    Person2 *person3 = [[Person2 alloc] initWithName:@"matt" age:16];
    Person2 *person4 = [[Person2 alloc] initWithName:@"Zeke" age:18];
    Person2 *person5 = [[Person2 alloc] initWithName:@"jesse" age:19];
    NSArray *people = @[ person1, person2, person3, person4, person5 ];
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    sorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    sorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES comparator:
              ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                if ([obj1 length] < [obj2 length]) {
                    return NSOrderedAscending;
                } return NSOrderedDescending;
            }];
    
    NSArray *sortedDescriptors = @[ sorter ];
    NSArray *sortedArray = [people sortedArrayUsingDescriptors:sortedDescriptors];
//    [people sortedArrayUsingDescriptor:sorter];
    NSLog(@"people : %@ sortedArray : %@",people, sortedArray);
     
     // NSSortConcurrent
     
}

- (void) doPredicateExamples {
    Person2 *person1 = [[Person2 alloc] initWithName:@"Lucas" age:18];
    Person2 *person2 = [[Person2 alloc] initWithName:@"Yoda" age:900];
    Person2 *person3 = [[Person2 alloc] initWithName:@"Matt" age:16];
    Person2 *person4 = [[Person2 alloc] initWithName:@"Zeke" age:18];
    Person2 *person5 = [[Person2 alloc] initWithName:@"Jesse" age:19];
    NSArray *people = @[ person1, person2, person3, person4, person5 ];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age < 19"];
    for (Person2 *p  in people) {
        NSLog(@"%@ : %d",p, [predicate evaluateWithObject:p]);
    }
    
    
    // filteredArrayUsingPredicate is a category to the nsarray class from the nspredicate class
    predicate = [NSPredicate predicateWithFormat:@"name ==[c] 'yoda'"]; // [c] is case insensitive, [d] is diacretic insensitive(no accents)
    NSArray *filteredArray = [people filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredArray : %@",filteredArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name.length < 5"];
    filteredArray = [people filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredArray : %@",filteredArray);
    
    predicate = [NSPredicate predicateWithFormat:@"name LIKE[c] '?e*'"]; // BEGINSWITH, ENDSWITH, CONTAINS, LIKE
    filteredArray = [people filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredArray : %@",filteredArray);
    
    int age = 18;
    predicate = [NSPredicate predicateWithFormat:@"age == %d",age];
    filteredArray = [people filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredArray : %@",filteredArray);
    
    predicate = [NSPredicate predicateWithFormat:@"(age > 18) AND (name CONTAINS 'e')"];
    filteredArray = [people filteredArrayUsingPredicate:predicate];
    NSLog(@"filteredArray : %@",filteredArray);
}

- (void) doARCExample {
    NSArray *array = @[@"Dog",@"Barky"];
    NSLog(@"array : %@",array);
    NSDictionary *dict = @{ @"key1" : @"Something One",
                            @"key2" : @"Something Two" };
    NSLog(@"dict : %@",dict[@"key2"]);
    
    NSMutableArray *arrayMut = [NSMutableArray arrayWithArray:@[ @"Cat", @"Paws" ]];
    arrayMut[1] = @"Patches"; // same as -> [arrayMut replaceObjectAtIndex:1 withObject:@"Patches"];
    [arrayMut replaceObjectAtIndex:1 withObject:@"Orange"];
    NSLog(@"arrayMut : %@",arrayMut);
    
    NSMutableDictionary *dictMut = [NSMutableDictionary dictionaryWithDictionary:@{ @"k" : @"1",
                                                                                    @"x" : @"2" }]; // must be done as nsmutabledicionary declares as nsdictionary
    dictMut[@"k"] = @"One";
    dictMut[@"y"] = @"3"; // create an entirely new key for the nsmutabledictionary
    NSLog(@"dictMut : %@",dictMut);
    
    // @synthesis variable no longer needed as backing variable is created by default
    
}
- (void) doLiteralExample { // Literals were added for dictionaries, arrays, and numbers for iOS 4.4 onwards
    NSNumber *literalNum1 = @1.2f;
    NSArray *array = @[@1,@2,@3];
    NSDictionary *dict = @{@"key1":@"value"};
    NSLog(@"literalNum1 : %@",literalNum1);
    NSLog(@"array : %@",array);
    NSLog(@"dict : %@",dict);
}
- (void) doClassExtExample {
    ClassExt *ourClass = [[ClassExt alloc] init];
//    [ourClass ]
    [ourClass log];
}

- (void) doBlocksExample {
    // blocks can take paramenters and have return types but are not functions
    int (^myBlock)(void) = ^{
        return 6;
    }; // void means it doesn't take in any values, and the int means it returns integers

    int num = 100;
    int (^testblock)(void);
    testblock = ^{
        return num * 2;
    };
    num = 10; // this will not change the number inside the block

    int x1 = 5;
    int (^adder)(int, int);
    adder = ^(int num,int x1){
        return num + x1;
    };
    x1 =  10;
    NSLog(@"myBlock : %d, testblock : %d, adder : %d",myBlock(),testblock(),adder(11,12));
}

- (void) doNSCodingExample {
    Rectangle *rect1 = [[Rectangle alloc] initWithHeight:56 width:48];
    Rectangle *rect2 = [[Rectangle alloc] initWithHeight:12 width:6];
    NSArray *array = [NSArray arrayWithObjects:rect1, rect2, nil];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    NSArray *arrayFromData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"arrayfrom decoding data from description method : %@",arrayFromData);
    NSLog(@"arrayfrom decoding data from description method (description) : %@",arrayFromData.description);
}

- (void) readWriteNSDataKeyedArchievsExample {

    NSArray *array = [NSArray arrayWithObjects:@"Bob",@"Nancy",@"Sid",@56, nil];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    NSString *fileName = @"/Test1.plist";
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [path objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingString:fileName];
    
    BOOL success = [data writeToFile:filePath
                           atomically:YES];
    if (!success) {
        NSLog(@"unable to write file : %@",filePath);
    } else {
        NSLog(@"file written : %@",filePath);
        NSData *dataFromFile = [[NSData alloc] initWithContentsOfFile:filePath];
        NSArray *arrayFromFile = [NSKeyedUnarchiver unarchiveObjectWithData:dataFromFile];
        NSArray *arrayFromFile1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"arrayFromFile : %@",arrayFromFile);
        NSLog(@"arrayFromFile1 : %@",arrayFromFile1);
//        NSLog(@"file contents filePath : %@",[NSDictionary dictionaryWithContentsOfFile:filePath] );
        NSLog(@"file contents filePath NSData : %@",[NSData dataWithContentsOfFile:filePath]);
    }
}

- (void) readWritePropertyListExample {
    NSString *fileName = @"/Test1.plist";
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [path objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingString:fileName];
    NSArray *array = [NSArray arrayWithObjects:@"Yoda",@"Luke",@"Vader", nil];
    NSDictionary *plist = [NSDictionary dictionaryWithObjectsAndKeys:array,@"Star Wars",@"Some Sring",@"Some Key", nil];
    
    BOOL success = [plist writeToFile:filePath
                              atomically:YES];
    
    if (!success) {
        NSLog(@"unable to write file : %@",filePath);
    } else {
        NSLog(@"file written : %@",filePath);
        NSLog(@"file contents filePath : %@",[NSDictionary dictionaryWithContentsOfFile:filePath] );
        NSLog(@"file contents filePath NSString : %@",[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL] );
    }
}

- (void) doWriteToFileExample {
    NSString *someText = @"Some text which was written to a file.";
    NSString *fileName = @"/fileName.txt";
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [path objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingString:fileName];
//    NSString *path = @"/Documents/myText.txt";
    //  NSString *pathOfFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"xml"];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    BOOL success = [someText writeToFile:filePath
               atomically:YES
                 encoding:NSUTF8StringEncoding
                    error:NULL];
    
    if ([filemanager fileExistsAtPath:filePath]) {
        NSLog(@"file exists : %@",filePath);
    } else {
        NSLog(@"no file : %@",filePath);
    }
    if (!success) {
        NSLog(@"unable to write file");
    } else {
        NSLog(@"file written");
    }
    
    NSString *newtext = [NSString stringWithContentsOfFile:filePath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    NSLog(@"%@",newtext);
}

-(void) doKeyValueObsExample {
    
    Person1 *me = [[Person1 alloc] init];
    Dog *dog = [[Dog alloc] init];
    
    // receive the new value when the new value is set
    [dog addObserver:me
          forKeyPath:@"hunger"
             options:NSKeyValueObservingOptionOld
             context:NULL];
    
    [dog setHunger:67];
    [dog setHunger:45];
    
    
    // make sure to remove/release the observers
    [dog removeObserver:me
             forKeyPath:@"hunger"];
}

-(void) doKeyValuePathsExample {
    Person *me = [[Person alloc] init];
    
    NSString *kpn1 = @"cookie.name";
    [me setValue:@"Oreos" forKeyPath:kpn1];
    NSLog(@"cookie : %@",[me valueForKeyPath:kpn1]);
}

- (void) doKeyValueCodingExample {
    Person *me = [[Person alloc] init];
    [me setValue:@"Sam" forKey:@"name"];
    [me setValue:@"2" forKey:@"age"];
    NSLog(@"%@",[me valueForKey:@"name"]);
    [me log];
    
    // Using a NSDicitonary to set multiple key values at once
    [me setValuesForKeysWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
                                        @"Lucas",@"name",
                                        @17,@"age",
                                        nil]];
    [me log];
    
    NSDictionary *dict = [me dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"name",@"age",nil]];
    NSLog(@"%@ dict : %@",[dict class],dict);
                          
}

-(void)doPersonExample1 {
    Person *me = [[Person alloc] init];

    id person; //id is a generic object pointer
    person = me;
    [person log];
    
    id <Logging> logger; // logger is an object pointer which conforms to the protocol Logging
    logger = me;
    [logger log];
    
}

-(void)doPersonExample2 {
    Person *me = [[Person alloc] init];
    
    if ([me conformsToProtocol:@protocol(Logging)]) {
        [me log];
    } else {
        NSLog(@"me does not conform");
    }
}

-(void)doDogExample1{
    Dog *dog = [[Dog alloc] init];
    [dog setAge:6];
    
    [dog log];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Yoda",@"Jedi",@"Darth Vader",nil];
    SEL message = @selector(addObject:); // takes in a new object and adds it to the end of the array
    SEL message1 = @selector(removeObject:inRange:); // represents taking multiple parameters
    
    if ([array respondsToSelector:message]) {
        NSLog(@"WORKS : addObject");
        [array addObject:@"Swartz"];
        [array performSelector:message withObject:@"Soda"];
    } else {
        NSLog(@"DOES NOT : respondsToSelector:message");
    }
    
    NSLog(@"array : %@",array);
    
    if ([array respondsToSelector:message1]) {
        NSLog(@"WORKS : removeObject:inRange:");
        
    } else {
        NSLog(@"DOES NOT : removeObject:inRange:");
    }
    [self someMethod:message];
    
    NSString *string1CategoryTest = @"http://pixar.com";
    NSString *string2CategoryTest = @"Pixar";
    
    if ([string1CategoryTest isURLPrefix]) { NSLog(@"%@ is a URL",string1CategoryTest); } else { NSLog(@"%@ is a NOT URL",string1CategoryTest);  }
    if ([string2CategoryTest isURLPrefix]) { NSLog(@"%@ is a URL",string2CategoryTest); } else { NSLog(@"%@ is NOT A URL",string2CategoryTest);  }
    
}
- (void)someMethod:(SEL)someSelector {
    NSLog(@"did call somemethod");
}
- (void)viewDidLoad:(BOOL)animated{
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
