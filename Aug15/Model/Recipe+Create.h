//
//  Recipe+Create.h
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "Recipe.h"

typedef enum {
    Easy,
    Intermediate,
    Advanced,
    Professional
} Difficulty;

@interface Recipe (Create)

+ (Recipe *)recipeWithUID:(NSString *)uid name:(NSString *)name author:(Author *)author inContext:(NSManagedObjectContext *)context;
+ (NSString *)GetUUID;

- (NSTimeInterval)prepTimeAsInterval;
- (NSTimeInterval)cookTimeAsInterval;
- (NSTimeInterval)totalTime;

@end
