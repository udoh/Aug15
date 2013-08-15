//
//  DemoRecipeList.h
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

//#import "RecipeList.h"

@interface DemoRecipeList : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)setup;

@end
