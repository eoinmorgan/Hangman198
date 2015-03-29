//
//  MainViewController.m
//  Hangman
//
//  Created by Eoin Morgan on 3/28/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *hangmanImageView;
@property (weak, nonatomic) IBOutlet UILabel *guessesSoFar;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewGame:self];
}

- (IBAction)makeGuess:(id)sender {
}

- (IBAction)startNewGame:(id)sender {
    // should randomly generate a string here
    self.game = [HangmanModel newGameWithString:@"Test"];
    [self redraw];
}

- (void)redraw {
    NSString *fileName = [self getImageForGuessNum:self.game.numGuesses];
    UIImage *hangmanImage = [UIImage imageNamed:fileName];
    self.hangmanImageView.image = hangmanImage;
}

- (NSString*)getImageForGuessNum:(int)numGuesses {
    return [NSString stringWithFormat:@"hang%d.jpg", numGuesses];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
