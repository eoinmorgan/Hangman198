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
        self.word = str;
        self.numUniqueLetters = [HangmanString countUniqueLetters:self.word];
    }
    return self;
}

- (BOOL)doesContainLetter:(NSString *)letter {
    NSRange range = [self.word rangeOfString:letter];
    if (range.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

- (BOOL)areStringsEqual:(NSString *)str {
    return [self.word isEqualToString:str];
}

- (NSString*)getDisplayForGuesses:(NSArray *)knownLetters {
    knownLetters = [knownLetters arrayByAddingObject:@" "];
    NSString *displayString = @"";
    for (int i = 0; i < self.word.length; i++) {
        NSString *letter = [self.word substringWithRange:NSMakeRange(i, 1)];
        if ([knownLetters containsObject:letter]) {
            displayString = [displayString stringByAppendingString:letter];
        } else {
            displayString = [displayString stringByAppendingString:@"?"];
        }
    }
    
    return displayString;
}

+ (int)countUniqueLetters:(NSString*)word {
    NSMutableSet *letters = [[NSMutableSet alloc] init];

    
    for (int i = 0; i < word.length; i++)
    {
        NSString *letter = [word substringWithRange:NSMakeRange(i, 1)];
        if (![letter isEqualToString:@" "]) {
            [letters addObject:letter];
        }
    }
    
    return (int)[letters count];
}

@end
