//
//  DemoRecipesCDTVC.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "DemoRecipesCDTVC.h"


@implementation DemoRecipesCDTVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.managedObjectContext) {
        [self useDemoDocument];
    }
}

- (void)useDemoDocument
{
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    url = [url URLByAppendingPathComponent:@"Recipes.coredata"];
    NSLog(@"%@", url);
    UIManagedDocument *document = [[UIManagedDocument alloc] initWithFileURL:url];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:[url path]]) {
        [document saveToURL:url
           forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success) {
                  self.managedObjectContext = document.managedObjectContext;
                  [self loadInitialData];
              } else {
                  NSLog(@"could not create document at URL %@", url);
              }
          }];
    } else if (document.documentState == UIDocumentStateClosed) {
        [document openWithCompletionHandler:^(BOOL success) {
            if (success) {
                self.managedObjectContext = document.managedObjectContext;
            } else {
                NSLog(@"could not open document at URL %@", url);
            }
        }];
    } else {
        self.managedObjectContext = document.managedObjectContext;
    }
}

- (void)loadInitialData  // load initial data
{
    self.demoRecipes = [[DemoRecipeList alloc] init];
    self.demoRecipes.managedObjectContext = self.managedObjectContext;
    
    [self.managedObjectContext performBlock:^{
        [self.demoRecipes setup];
    }];
}

@end
