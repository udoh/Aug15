//
//  IngredientsViewController.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "IngredientsViewController.h"
#import "Recipe.h"

@interface IngredientsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *recipeName;

@end

@implementation IngredientsViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.textView.text = self.recipe.ingredients;
    self.recipeName.text = self.recipe.recipeName;
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
    self.recipe.ingredients = self.textView.text;
}

- (void)keyboardWillShow:(NSNotification*)aNotification
{
    CGRect theFrame = [[aNotification userInfo][UIKeyboardFrameBeginUserInfoKey] CGRectValue];

    CGRect originalFrame = self.textView.frame;
    NSLog(@"%g x %g", originalFrame.size.width, originalFrame.size.height);
    originalFrame.size.height -= theFrame.size.height;    
    self.textView.frame = originalFrame;
}

- (void)keyboardWillHide:(NSNotification*)aNotification
{
    CGRect originalFrame = self.textView.frame;
    NSLog(@"%g x %g", originalFrame.size.width, originalFrame.size.height);
    originalFrame.size.height += 216;   // hard coded!  change
    self.textView.frame = originalFrame;
}

- (IBAction)hideKeyboard:(UIButton *)sender
{
    [self.textView resignFirstResponder];
}
@end
