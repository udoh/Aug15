//
//  RecipesViewController.h
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataTableViewController.h"

@interface RecipesViewController : CoreDataTableViewController <UITableViewDataSource , UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
