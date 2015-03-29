//
//  MainViewController.h
//  Hangman
//
//  Created by Eoin Morgan on 3/28/15.
//  Copyright (c) 2015 Morgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanModel.h"

@interface MainViewController : UIViewController

@property HangmanModel *game;

- (IBAction)startNewGame:(id)sender;

@end
