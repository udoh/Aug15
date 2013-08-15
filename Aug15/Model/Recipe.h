//
//  Recipe.h
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author;

@interface Recipe : NSManagedObject

@property (nonatomic) int16_t cookTime;
@property (nonatomic) NSTimeInterval dateCreated;
@property (nonatomic) int16_t difficultyLevel;
@property (nonatomic, retain) NSString * directions;
@property (nonatomic, retain) NSString * ingredients;
@property (nonatomic) float numberOfServings;
@property (nonatomic, retain) NSString * photographer;
@property (nonatomic) int16_t prepTime;
@property (nonatomic) int16_t rating;
@property (nonatomic, retain) NSData * recipeImage;
@property (nonatomic, retain) NSString * recipeName;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) Author *author;

@end
