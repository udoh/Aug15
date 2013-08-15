//
//  RecipeDetailViewController.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "IngredientsViewController.h"
#import "DirectionsViewController.h"
#import "RecipeEditViewController.h"
#import "ImageViewController.h"
#import "Recipe+Create.h"
#import "Author+Create.h"
#import "StarView.h"


@interface RecipeDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *recipeTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UIImageView *recipeImage;
@property (nonatomic, weak) IBOutlet UILabel *yieldLabel;
@property (nonatomic, weak) IBOutlet UILabel *totalTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UILabel *cookTimeLabel;
@property (nonatomic, weak) IBOutlet StarView *ratingView;

@end

@implementation RecipeDetailViewController

- (void)setRecipe:(Recipe *)r
{
    _recipe = r;
    [self.navigationItem setTitle:_recipe.recipeName];
}

- (IBAction)showIngredients:(UIButton *)sender
{
    IngredientsViewController *ivc = [[IngredientsViewController alloc] init];
    [ivc setRecipe:self.recipe];
    
    [self.navigationController pushViewController:ivc animated:YES];
}

- (IBAction)showDirections:(UIButton *)sender
{
    DirectionsViewController *dvc = [[DirectionsViewController alloc] init];
    [dvc setRecipe:self.recipe];
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (IBAction)showImage:(UIButton *)sender
{
    ImageViewController *imgvc = [[ImageViewController alloc] init];
    [imgvc setRecipe:self.recipe];
    
    [self.navigationController pushViewController:imgvc animated:YES];
}

- (IBAction)editMode:(UIButton *)sender
{
    RecipeEditViewController *evc = [[RecipeEditViewController alloc] init];
    [evc setRecipe:self.recipe];
    
    [self.navigationController pushViewController:evc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
}

- (void)refreshUI
{
    [self.ratingView setNeedsDisplay];
    [self.recipeTitleLabel setNeedsDisplay];
    [self.authorLabel setNeedsDisplay];
    [self.yieldLabel setNeedsDisplay];
    [self.navigationItem setTitle:_recipe.recipeName];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshUI];
    
    NSString *level;
    
    switch (self.recipe.difficultyLevel) {
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
    
    self.recipeTitleLabel.text = self.recipe.recipeName;
    self.authorLabel.text = [NSString stringWithFormat:@"By: %@", self.recipe.author.name ];
    self.recipeImage.image = [UIImage imageWithData:self.recipe.recipeImage];
    self.totalTimeLabel.text = [self stringFromTimeInterval:self.recipe.totalTime];
    self.prepTimeLabel.text = [self stringFromTimeInterval:self.recipe.prepTimeAsInterval];
    self.cookTimeLabel.text = [self stringFromTimeInterval:self.recipe.cookTimeAsInterval];
    self.yieldLabel.text = [NSString stringWithFormat:@"%g servings (%@)", self.recipe.numberOfServings, level];
    self.ratingView.rating = self.recipe.rating;
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    //NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    NSString *result = (hours > 0) ? ([NSString stringWithFormat:@"%ih %im", hours, minutes]) : [NSString stringWithFormat:@"%im", minutes];
    
    return result;
}

@end
