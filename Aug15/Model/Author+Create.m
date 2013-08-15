//
//  Author+Create.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "Author+Create.h"

@implementation Author (Create)

+ (Author *)authorWithName:(NSString *)name inContext:(NSManagedObjectContext *)context
{
    Author *author = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Author"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
                                
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || [matches count] > 1) {
        // handle errors
    } else if (![matches count]) {
        author = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:context];
        author.name = name;
    } else {
        author = [matches lastObject];
    }

    return author;
}

@end
