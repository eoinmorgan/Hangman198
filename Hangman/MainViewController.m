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
@property (weak, nonatomic) IBOutlet UITextField *guessTextField;
@property (weak, nonatomic) IBOutlet UILabel *displayString;
@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wordGen = [[HangmanWords alloc] init];
    [self startNewGame:self];
}

- (IBAction)makeGuess:(id)sender {
    NSString *guess = self.guessTextField.text;
    if (guess.length == 0) {
        return;
    } else if (guess.length == 1) {
        [self.game makeGuessWithLetter:guess];
    } else {
        [self.game makeGuessWithString:guess];
    }
    
    self.guessTextField.text = @"";
    self.guessesSoFar.text = [self.game getGuessString];
    [self redraw];
}

- (IBAction)startNewGame:(id)sender {
    // should randomly generate a string here
    NSString *word =[self.wordGen getWord];
    self.game = [HangmanModel newGameWithString:word];
    NSLog(@"%@",    word);
    [self redraw];
    
    self.guessesSoFar.text = [self.game getGuessString];
}

- (void)redraw {
    NSString *fileName = [self getImageForGuessNum:self.game.numGuesses];
    UIImage *hangmanImage = [UIImage imageNamed:fileName];
    self.hangmanImageView.image = hangmanImage;
    self.displayString.text = [self.game getDisplayString];
    if (self.game.gameIsOver) {
        self.gameOverLabel.hidden = NO;
    } else {
        self.gameOverLabel.hidden = YES;
    }
    
}

- (NSString*)getImageForGuessNum:(int)numGuesses {
    return [NSString stringWithFormat:@"hang%d.jpg", numGuesses];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
