//
//  HangmanStringTests.m
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "HangmanModel.h"
#import <XCTest/XCTest.h>

//
//  HangmanStringTests.h
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

@interface HangmanModelTests : XCTestCase

@end

@implementation HangmanModelTests

- (void)testBasicCase {
    HangmanModel *model = [[HangmanModel alloc] initWithString:@"TEST STRING"];
    
    [model makeGuessWithLetter:@"A"];
    [model makeGuessWithLetter:@"A"];
    XCTAssertEqual([model.guesses count], 1);
    XCTAssertEqual(model.numGuesses, 1);
    
    [model makeGuessWithLetter:@"T"];
    XCTAssertEqual([model.guesses count], 2);
    XCTAssertEqual(model.numGuesses, 1);
    
    [model makeGuessWithLetter:@"Z"];
    [model makeGuessWithLetter:@"Y"];
    [model makeGuessWithLetter:@"X"];
    [model makeGuessWithLetter:@"W"];
    [model makeGuessWithLetter:@"V"];
    XCTAssertEqual(model.gameIsOver, YES);
    XCTAssertEqual([model.guesses count], 7);
    [model makeGuessWithLetter:@"V"];
    XCTAssertEqual([model.guesses count], 7);
    XCTAssertEqual(model.correctGuesses, 1);
    
    model = [HangmanModel newGameWithString:@"TEST2"];
    [model makeGuessWithString:@"test2"];
    XCTAssertEqual(model.gameIsOver, YES);
    
    model = [HangmanModel newGameWithString:@"TEST3"];
    [model makeGuessWithLetter:@"T"];
    [model makeGuessWithLetter:@"E"];
    [model makeGuessWithLetter:@"S"];
    [model makeGuessWithLetter:@"3"];
    XCTAssertEqual([model gameIsOver], YES);
    XCTAssertEqual(model.correctGuesses, 4);
    XCTAssertEqual([model.guesses count], 4);
}

@end
