//
//  HangmanString.h
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanString : NSObject

@property NSString *str;

- (id)initWithString:(NSString*)str;
- (BOOL)doesContainLetter:(NSString*)letter;
- (BOOL)areStringsEqual:(NSString*)str;
- (NSString*)getDisplayForGuesses:(NSArray*)knownLetters;

@end
