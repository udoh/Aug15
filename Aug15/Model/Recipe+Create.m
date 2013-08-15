//
//  Recipe+Create.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "Recipe+Create.h"
#import "Author.h"

@implementation Recipe (Create)

+ (Recipe *)recipeWithUID:(NSString *)uid name:(NSString *)name author:(Author *)author inContext:(NSManagedObjectContext *)context
{
    Recipe *recipe = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Recipe"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"recipeName" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"uid = %@", uid];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || [matches count] > 1) {  // fetch does not work or result is not unique
        // handle error
    } else if (![matches count]) {  // no records returned
        recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe" inManagedObjectContext:context];
        recipe.uid = [Recipe GetUUID];
        recipe.recipeName = name;
        recipe.author = author;
    } else {
        recipe = [matches lastObject];
    }
    
    return recipe;
}

- (NSTimeInterval)prepTimeAsInterval
{
    return self.prepTime;
}

- (NSTimeInterval)cookTimeAsInterval
{
    return self.cookTime;
}

- (NSTimeInterval)totalTime
{
    return self.prepTimeAsInterval + self.cookTimeAsInterval;
}

+ (NSString *)GetUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

@end
