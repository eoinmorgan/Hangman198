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
        self.maxGuesses = 6;
        self.numGuesses = 0;
        self.correctGuesses = 0;
        self.guesses = [NSMutableArray arrayWithObjects: nil];
        self.gameIsOver = NO;
    }
    return self;
}

- (NSString *)getDisplayString {
    return [self.word getDisplayForGuesses:[NSArray arrayWithArray:self.guesses]];
}

// returns a new instance of HangmanModel, representing a new game
+ (HangmanModel *)newGameWithString:(NSString *)str {
    return [[HangmanModel alloc] initWithString:str];
}

- (void)makeGuessWithLetter:(NSString *)letter {
    // ignore if game is over or we try adding a duplicate letter
    if (self.gameIsOver || [self.guesses containsObject:letter]) {
        return;
    }
    
    letter = [letter uppercaseString];
    
    
    [self.guesses addObject:letter];
    if ([self.word doesContainLetter:letter]) {
        self.correctGuesses++;
        if (self.correctGuesses == self.word.numUniqueLetters) {
            self.gameIsOver = YES;
        }
        
    }else {
        self.numGuesses++;
    }
    
    if (self.numGuesses >= self.maxGuesses) {
        self.gameIsOver = YES;
    }
    
}

- (void)makeGuessWithString:(NSString *)str {
    if (self.gameIsOver) {
        return;
    }
    
    str = [str uppercaseString];
    
    if ([str isEqualToString:self.word.word]) {
        self.gameIsOver = YES;
    } else {
        self.numGuesses++;
        if (self.numGuesses >= self.maxGuesses) {
            self.gameIsOver = YES;
        }
    }
}

@end
