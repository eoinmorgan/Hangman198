//
//  HangmanModel.m
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "HangmanModel.h"

@implementation HangmanModel

- (id)initWithString:(NSString*)str {
    if (self = [super init]) {
        self.word = [[HangmanString alloc] initWithString:str];
        self.maxGuesses = 14;
        self.numGuesses = 0;
        self.guesses = [NSMutableArray arrayWithObjects: nil];
    }
    return self;
}

- (BOOL)isGameOver {
    return self.numGuesses >= self.maxGuesses;
}

- (NSString *)getDisplayString {
    return [self.word getDisplayForGuesses:[NSArray arrayWithArray:self.guesses]];
}

// returns a new instance of HangmanModel, representing a new game
+ (HangmanModel *)newGameWithString:(NSString *)str {
    return [[HangmanModel alloc] initWithString:str];
}

// returns YES iff we added a new letter to our list of guesses (ie. that letter was not already present)
- (BOOL)makeGuessWithLetter:(NSString *)letter {
    if ([self.guesses containsObject:letter]) {
        return NO;
    } else {
        [self.guesses addObject:letter];
        return YES;
    }
}

@end
