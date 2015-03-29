//
//  HangmanString.m
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "HangmanString.h"

@implementation HangmanString

- (id)initWithString:(NSString*)str {
    if (self = [super init]) {
        self.str = str;
    }
    return self;
}

- (BOOL)doesContainLetter:(NSString *)letter {
    NSRange range = [self.str rangeOfString:letter];
    if (range.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

- (BOOL)areStringsEqual:(NSString *)str {
    return [self.str isEqualToString:str];
}

- (NSString*)getDisplayForGuesses:(NSArray *)knownLetters {
    knownLetters = [knownLetters arrayByAddingObject:@" "];
    NSString *displayString = @"";
    for (int i = 0; i < self.str.length; i++) {
        NSString *letter = [self.str substringWithRange:NSMakeRange(i, 1)];
        if ([knownLetters containsObject:letter]) {
            displayString = [displayString stringByAppendingString:letter];
        } else {
            displayString = [displayString stringByAppendingString:@"?"];
        }
    }
    
    return displayString;
}

@end
