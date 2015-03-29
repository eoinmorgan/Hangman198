//
//  ViewController.m
//  Hangman
//
//  Created by Eoin Morgan on 3/24/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import "HangmanController.h"
#import "HangmanModel.h"

@interface HangmanController ()

@property (weak, nonatomic) IBOutlet UITextField *guessTextField;
@property (weak, nonatomic) IBOutlet UILabel *wordDisplayTextField;
@property (weak, nonatomic) IBOutlet UIView *hangmanImageView;

@property HangmanModel *game;

@end

@implementation HangmanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.game = [[HangmanModel alloc] initWithString:@"TEST"];
    self.hangmanImageView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)redraw {
    NSString *imageName = @"hang";
    NSString *imageNum = [NSString stringWithFormat:@"%d.jpg", self.game.numGuesses];
    imageName = [imageName stringByAppendingString:imageNum];
    UIImage *hangmanImage = [UIImage imageNamed:imageName];
    [self.hangmanImageView addSubview:[[UIImageView alloc] initWithImage:hangmanImage]];
    [self.hangmanImageView setNeedsDisplay];
}

- (IBAction)makeGuess:(id)sender {
    
}

- (IBAction)newGame:(id)sender {
    self.game = [HangmanModel newGameWithString:@"TEST2"];
    [self redraw];
}

@end
