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
@property int correctGuesses;
@property NSMutableArray *guesses;
@property BOOL gameIsOver;

+ (HangmanModel*)newGameWithString:(NSString*)str;
- (id)initWithString:(NSString*)str;
- (NSString*)getDisplayString;
- (void)makeGuessWithLetter:(NSString*)letter;
- (void)makeGuessWithString:(NSString*)str;

@end
