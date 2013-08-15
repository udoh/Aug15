//
//  RecipeEditViewController.h
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "StarView.h"

@interface RecipeEditViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Recipe *recipe;

@end
