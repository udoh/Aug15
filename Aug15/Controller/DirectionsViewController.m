//
//  DirectionsViewController.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "DirectionsViewController.h"
#import "Recipe.h"

@interface DirectionsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *recipeName;
@property (weak, nonatomic) IBOutlet UITextView *directionsText;

@end

@implementation DirectionsViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.recipeName.text = self.recipe.recipeName;
    self.directionsText.text = self.recipe.directions;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.recipe.directions = self.directionsText.text;
}

- (void)keyboardWillShow:(NSNotification*)aNotification
{
    CGRect theFrame = [[aNotification userInfo][UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect originalFrame = self.directionsText.frame;
    originalFrame.size.height -= theFrame.size.height;
    self.directionsText.frame = originalFrame;
}

- (void)keyboardWillHide:(NSNotification*)aNotification
{
    CGRect originalFrame = self.directionsText.frame;
    NSLog(@"%g x %g", originalFrame.size.width, originalFrame.size.height);
    originalFrame.size.height += 216;   // hard coded!  change
    self.directionsText.frame = originalFrame;
}

- (IBAction)hideKeyboard:(UIButton *)sender
{
    [self.directionsText resignFirstResponder];
}
@end
