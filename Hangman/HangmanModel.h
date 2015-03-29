//
//  HangmanModel.h
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HangmanString.h"

@interface HangmanModel : NSObject

@property HangmanString *word;
@property int maxGuesses;
@property int numGuesses;
@property BOOL guessedWord;
@property NSMutableArray *guesses;

+ (HangmanModel*)newGameWithString:(NSString*)str;
- (id)initWithString:(NSString*)str;
- (BOOL)isGameOver;
- (NSString*)getDisplayString;
- (BOOL)makeGuessWithLetter:(NSString*)letter;
- (BOOL)makeGuessWithString:(NSString*)str;

@end
