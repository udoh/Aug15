//
//  RecipeEditViewController.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "RecipeEditViewController.h"
#import "Author+Create.h"
#import "StarView.h"

@interface RecipeEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameEditField;
@property (weak, nonatomic) IBOutlet UITextField *auhorEditField;
@property (weak, nonatomic) IBOutlet UITextField *prepTimeField;
@property (weak, nonatomic) IBOutlet UITextField *cookTimeField;
@property (weak, nonatomic) IBOutlet StarView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *servingsLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (weak, nonatomic) IBOutlet UIStepper *servingsStepper;
@property (weak, nonatomic) IBOutlet UIStepper *levelStepper;

@end

@implementation RecipeEditViewController

- (void)viewDidLoad
{
    self.nameEditField.text = self.recipe.recipeName;
    self.auhorEditField.text = self.recipe.author.name;
    self.prepTimeField.text = [NSString stringWithFormat:@"%d", self.recipe.prepTime / 60];
    self.cookTimeField.text = [NSString stringWithFormat:@"%d", self.recipe.cookTime / 60];
    self.ratingStepper.value = self.recipe.rating;
    self.ratingView.rating = self.recipe.rating;
    self.servingsLabel.text = [NSString stringWithFormat:@"%g", self.recipe.numberOfServings];
    self.servingsStepper.value = self.recipe.numberOfServings;
    self.levelLabel.text = [self levelDescriptionFromInt:self.recipe.difficultyLevel];
    self.levelStepper.value = self.recipe.difficultyLevel;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard:nil];
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.recipe.recipeName = self.nameEditField.text;
    
    if (!self.recipe.author) {
        // create new author;
        Author *newAthor = [Author authorWithName:self.auhorEditField.text inContext:self.recipe.managedObjectContext];
        self.recipe.author = newAthor;
    } else {
        // set name of existing author
        self.recipe.author.name = self.auhorEditField.text;
    }
    
    self.recipe.prepTime = [self.prepTimeField.text floatValue] * 60;
    self.recipe.cookTime = [self.cookTimeField.text floatValue] * 60;
}

- (IBAction)ratingChanged:(UIStepper *)sender
{
    self.recipe.rating = sender.value;
    self.ratingView.rating = sender.value;
    [self.ratingView setNeedsDisplay];
}

- (IBAction)servingsChanged:(UIStepper *)sender
{
    self.recipe.numberOfServings = sender.value;
    self.servingsLabel.text = [NSString stringWithFormat:@"%g", sender.value];
}

- (IBAction)levelChanged:(UIStepper *)sender
{
    self.recipe.difficultyLevel = sender.value;
    self.levelLabel.text = [self levelDescriptionFromInt:self.recipe.difficultyLevel];
}

- (IBAction)hideKeyboard:(UIButton *)sender
{
    [self.nameEditField resignFirstResponder];
    [self.auhorEditField resignFirstResponder];
    [self.prepTimeField resignFirstResponder];
    [self.cookTimeField resignFirstResponder];
}

- (NSString *)levelDescriptionFromInt:(int)intLevel
{
    NSString *level;
    switch (intLevel) {
        case 0:
            level = @"Easy";
            break;
        case 1:
            level = @"Intermediate";
            break;
            
        case 2:
            level = @"Advanced";
            break;
        case 3:
            level = @"Professional";
            break;
        default:
            break;
    }
    return level;
}

@end
