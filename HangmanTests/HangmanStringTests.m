//
//  HangmanStringTests.m
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "HangmanString.h"
#import <XCTest/XCTest.h>

//
//  HangmanStringTests.h
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

@interface HangmanStringTests : XCTestCase

@end

@implementation HangmanStringTests

- (void)testDoesContainLetter {
    NSString *str = @"TEST STRING";
    HangmanString *hs = [[HangmanString alloc] initWithString:str];
    BOOL result;
    
    result = [hs doesContainLetter:@"T"];
    XCTAssertTrue(result);
    
    result = [hs doesContainLetter:@"Q"];
    XCTAssertFalse(result);
}

- (void)testGetDisplayForGuesses {
    NSString *str = @"TEST STRING";
    HangmanString *hs = [[HangmanString alloc] initWithString:str];
    
    NSArray *guesses1 = @[@"T", @"S", @"G"];
    NSString *display1 = [hs getDisplayForGuesses:guesses1];
    NSString *expected1 = @"T?ST ST???G";
    XCTAssertTrue([display1 isEqualToString:expected1]);
    
    NSArray *guesses2 = @[@"E", @"I", @"N"];
    NSString *display2 = [hs getDisplayForGuesses:guesses2];
    NSString *expected2 = @"?E?? ???IN?";
    XCTAssertTrue([display2 isEqualToString:expected2]);
}

- (void) testCountUniqueLetters {
    NSString *str = @"TEST STRING";
    HangmanString *hs = [[HangmanString alloc] initWithString:str];
    
    XCTAssertEqual([hs countUniqueLetters], 7);
    
    str = @"TTTTTTT";
    hs = [[HangmanString alloc] initWithString:str];
    
    XCTAssertEqual([hs countUniqueLetters], 1);
}

@end
