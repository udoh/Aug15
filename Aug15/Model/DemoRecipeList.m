//
//  DemoRecipeList.m
//  Aug1
//
//  Created by Udo Hoppenworth on 8/15/13.
//  Copyright (c) 2013 Udo Hoppenworth. All rights reserved.
//

#import "DemoRecipeList.h"
#import "Recipe+Create.h"
#import "Author+Create.h"

@implementation DemoRecipeList


- (void)setup
{
    // recipe 1
    Recipe *r = [Recipe recipeWithUID:@"1"
                                 name:@"Perfectly Grilled Steak"
                               author:[Author authorWithName:@"Bobby Flay" inContext:self.managedObjectContext]
                            inContext:self.managedObjectContext];
    
    r.uid = @"1";
    r.recipeName = @"Perfectly Grilled Steak";
    
    r.prepTime = 15 * 60;
    r.cookTime = 15 * 60;
    r.rating = 4.0;
    r.numberOfServings = 4.0;
    r.difficultyLevel = Easy;
    
    r.ingredients = @"4 1 1/4-to-1 1/2-inch-thick boneless rib-eye or New York strip steaks (about 12 ounces each) or filets mignons (8 to 10 ounces each), trimmed\n\n2 tablespoons canola or extra-virgin olive oil\n\nKosher salt and freshly ground pepper";
    
    r.directions = @"About 20 minutes before grilling, remove the steaks from the refrigerator and let sit, covered, at room temperature.\n\nHeat your grill to high. Brush the steaks on both sides with oil and season liberally with salt and pepper. Place the steaks on the grill and cook until golden brown and slightly charred, 4 to 5 minutes. Turn the steaks over and continue to grill 3 to 5 minutes for medium-rare (an internal temperature of 135 degrees F), 5 to 7 minutes for medium (140 degrees F) or 8 to 10 minutes for medium-well (150 degrees F).\n\nTransfer the steaks to a cutting board or platter, tent loosely with foil and let rest 5 minutes before slicing.";
    
    r.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"steak.jpg"], 1.0)];
    r.photographer = @"Steve Giralt";
        
    r = nil;
    
    // recipe 2
    r = [Recipe recipeWithUID:@"2"
                         name:@"Steak Fajitas with Chimichurri"
                       author:[Author authorWithName:@"Sunny Anderson" inContext:self.managedObjectContext]
                    inContext:self.managedObjectContext];
    
    r.prepTime = 20 * 60;
    r.cookTime = 25 * 60;
    r.rating = 3.0;
    r.numberOfServings = 4.0;
    r.difficultyLevel = Easy;
    
    r.ingredients = @"1 bunch fresh parsley\n1 bunch fresh cilantro\n1 to 2 cloves garlic\n1 large red onion, halved and sliced\nKosher salt and freshly ground pepper\n2 tablespoons red wine vinegar\n3 tablespoons lemon juice\n1/2 cup plus 1 tablespoon extra-virgin olive oil\n1 pound chuck or top round steak (London broil)\n3 poblano peppers, seeded and cut into strips\n1/4 cup lager beer\n8 8-inch flour tortillas\nLime wedges, for serving (optional)";
    
    r.directions = @"Combine the parsley and cilantro (leaves and stems), garlic, half of the sliced onion, 1 tablespoon salt, 1 teaspoon pepper, vinegar, 2 tablespoons lemon juice and 1/2 cup olive oil in a food processor; blend into a thick and smooth chimichurri sauce. Pierce both sides of the steak with a fork several times; place in a resealable plastic bag and add half of the sauce. Seal the bag and turn to coat the steak; refrigerate for at least 1 hour. Cover and reserve the remaining sauce.\n\nPreheat a grill to medium-high. Remove the steak from the bag (discard the bag of sauce); season with salt and pepper and grill until medium-rare, about 6 minutes per side. Let rest, loosely covered with foil, for 10 minutes.\n\nMeanwhile, heat the remaining 1 tablespoon olive oil in a large skillet over medium-high heat. Add the peppers and the remaining sliced onion half; season with salt and pepper. Saute until the vegetables are softened and caramelized around the edges, about 8 minutes. Add the beer, cover and cook until the peppers are tender, about 5 minutes.\n\nWarm the tortillas on the grill. Thinly slice the steak on the bias; divide among the tortillas along with the peppers and onions. Thin the reserved chimichurri sauce with the remaining 1 tablespoon lemon juice; drizzle over the fajitas. Serve with lime wedges, if desired.";
    
    r.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"fajitas.jpg"], 1.0)];
    r.photographer = @"Kana Okada";
    
    r = nil;
    
    // recipe 3
    r = [Recipe recipeWithUID:@"3"
                         name:@"Roasted-Pepper Pasta Salad"
                       author:[Author authorWithName:@"Foodnetwork Magazine" inContext:self.managedObjectContext]
                    inContext:self.managedObjectContext];
    
    r.prepTime = 10 * 60;
    r.cookTime = 20 * 60;
    r.rating = 4.0;
    r.numberOfServings = 4.0;
    r.difficultyLevel = Advanced;
    
    r.ingredients = @"Kosher salt\n12 ounces mezzi rigatoni or other short tube-shaped pasta\n2 bell peppers (red and/or yellow), halved, stemmed and seeded\n6 cloves garlic, unpeeled\n1/4 cup almonds\n1/3 cup extra-virgin olive oil\n1 lemon\n8 ounces bocconcini (small mozzarella balls)\n1 bunch fresh basil, leaves torn\nFreshly ground pepper";
    
    r.directions = @"Preheat the broiler. Bring a pot of salted water to a boil. Add the pasta and cook as the label directs. Drain and rinse under cold water to stop the cooking. Shake off the excess water.\n\nMeanwhile, place the bell peppers cut-side down on a foil-lined broiler pan, add the garlic and broil until charred, 7 to 8 minutes. Transfer the peppers to a bowl, cover and set aside about 5 minutes.\n\nHeat a dry skillet over medium-high heat. Add the almonds and toast, shaking the pan, 4 to 5 minutes. Let cool, then coarsely chop.\n\nSqueeze the garlic from its skin onto a cutting board. Add 1/2 teaspoon salt; mince and mash the garlic into a paste with a large knife. Peel the roasted peppers and slice into strips; transfer to a large bowl. Add the garlic paste and drizzle with the olive oil. Finely grate about 1 teaspoon lemon zest into the bowl and squeeze in all of the lemon juice. Add the bocconcini, basil, almonds, pasta, 1 teaspoon salt, and pepper to taste; toss.\n\nPer serving: Calories 731; Fat 37 g (Saturated 11 g); Cholesterol 41 mg; Sodium 845 mg; Carbohydrate 73 g; Fiber 6 g; Protein 26 g";
    
    r.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"pasta.jpg"], 1.0)];
    r.photographer = @"Antonis Achilleos";
    
    r = nil;
    
    // recipe 4
    r = [Recipe recipeWithUID:@"4"
                         name:@"Greek Caponata"
                       author:[Author authorWithName:@"Giada De Laurentiis" inContext:self.managedObjectContext]
                    inContext:self.managedObjectContext];
    
    r.prepTime = 10 * 60;
    r.cookTime = 55 * 60;
    r.rating = 5.0;
    r.numberOfServings = 6.0;
    r.difficultyLevel = Easy;
    
    r.ingredients = @"1 (14.5-ounce) can diced tomatoes with their juice\n2 zucchini, cut into 1-inch rounds\n2 summer squash, cut into 1-inch rounds\n2 tomatoes, cut into wedges\n1 large Japanese eggplant, cut into 1-inch rounds\n1 red onion, peeled and cut into 1-inch wedges\n1 potato, peeled and cut into 1-inch cubes\n3 garlic cloves, minced\n1/4 cup extra-virgin olive oil\n1 1/2 teaspoons salt\n1 teaspoon freshly ground black pepper\n1 teaspoon dried oregano\n4 to 6 slices toasted sourdough bread, optional for main dish";
    
    r.directions = @"Preheat the oven to 400 degrees F.\n\nPour the canned tomatoes into a 3 1/2-quart baking dish and spread to cover the bottom. In a large bowl combine the remaining ingredients (excluding the bread). Toss to coat. Pour the vegetables over the canned tomatoes in an even layer. Cover the baking dish with foil and bake for 20 minutes. Remove the foil and bake until the edges of the vegetables are golden, about 30 to 40 minutes.\n\nServe alone as a side, or over toasted sourdough bread for a main dish.";
    
    r.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"veggies.jpg"], 1.0)];
    r.photographer = @"n/a";
    
    r = nil;
    
    // recipe 5
    r = [Recipe recipeWithUID:@"5"
                         name:@"Mushroom and Cauliflower Lasagna"
                       author:[Author authorWithName:@"Bobby Flay" inContext:self.managedObjectContext]
                    inContext:self.managedObjectContext];
    
    r.prepTime = 85 * 60;
    r.cookTime = 140 * 60;
    r.rating = 4.0;
    r.numberOfServings = 8.0;
    r.difficultyLevel = Intermediate;
    
    r.ingredients = @"For the tomato sauce:\n2 tablespoons extra-virgin olive oil\n1 small Spanish onion, finely diced\n2 cloves garlic, finely chopped\nPinch of red pepper flakes\n3 cups canned plum tomatoes and their juices\n2 tablespoons chopped fresh basil\nKosher salt and freshly ground pepper\n3 tablespoons chopped fresh parsley\n1 1/2 teaspoons honey\n\nFor the cauliflower mornay sauce:\n1 head cauliflower\n2 tablespoons extra-virgin olive oil\nKosher salt and freshly ground pepper\n4 tablespoons unsalted butter\n1/4 cup all-purpose flour\n5 cups whole milk, heated\n1/8 teaspoon freshly grated nutmeg\n1/2 cup grated romano cheese\n\nFor the lasagna:\n1 ounce dried porcini mushrooms\nKosher salt\n16 lasagna noodles\n1 pound sheep's milk ricotta cheese\n1 large egg\n3/4 cup chopped fresh parsley, plus more for garnish\n3 teaspoons finely chopped fresh thyme\n1 cup grated romano cheese\nFreshly ground pepper\n3 tablespoons extra-virgin olive oil\n3 cloves garlic, smashed\n1 1/2 pounds assorted mushrooms, chopped\n2 shallots, finely diced\n1 1/4 pounds fontina cheese, coarsely grated";
    
    r.directions = @"Make the tomato sauce: Heat the olive oil in a saucepan over medium-high heat. Add the onion and cook, stirring occasionally, until soft, about 8 minutes. Add the garlic and red pepper flakes and cook 30 seconds. Add the tomatoes, breaking them up with a wooden spoon, and the basil and cook until thickened, about 10 minutes. Season with salt and pepper. Transfer to a blender and puree until smooth; return to the saucepan and add the parsley, honey, 1/4 teaspoon salt, and pepper to taste.\n\nMake the cauliflower Mornay sauce: Preheat the oven to 350 degrees F. Cut off the cauliflower florets and put in a small roasting pan. Drizzle with the olive oil and season with salt and pepper. Add 1 1/2 cups water to the pan, cover with aluminum foil and bake until very tender, about 1 hour. Remove from the oven.\n\nMelt the butter in a saucepan over medium heat. Whisk in the flour and cook 30 seconds. Whisk in 4 cups milk, increase the heat to medium high and bring to a boil, whisking; cook, whisking, until thick, about 5 minutes. Add the cauliflower, reduce the heat to low and cook 5 more minutes. Remove from the heat and let cool slightly, then puree until smooth. Strain into a clean saucepan and bring to a simmer over low heat. Whisk in the nutmeg, cheese, and salt and pepper to taste and cook 1 minute. Thin with some of the remaining 1 cup milk, if needed.\n\nMake the lasagna: Soak the porcini mushrooms in 1 1/4 cups boiling water, 30 minutes. Meanwhile, bring a large pot of salted water to a boil. Add the lasagna noodles and cook 5 minutes; drain and rinse under cold water. Set aside. Preheat the oven to 375 degrees F.\n\nCombine the ricotta, egg, 1/2 cup parsley, 1 teaspoon thyme and 1/2 cup romano cheese in a bowl and season with salt and pepper.\n\nHeat the olive oil in a saute pan over high heat. Add the garlic and cook 1 minute. Add the assorted mushrooms and cook until soft, about 4 minutes. Add the shallots and cook until golden, about 6 minutes. Drain the porcini mushrooms, reserving the liquid, then coarsely chop and add to the pan; cook 1 minute. Deglaze with the porcini soaking liquid and cook until completely reduced, about 6 minutes. Stir in the remaining 2 teaspoons thyme and 1/4 cup parsley and season with salt and pepper. Remove from the heat.\n\nTo assemble the lasagna, ladle some of the tomato sauce into a 10-by-14-inch baking dish. Ladle on some of the cauliflower sauce; top with 4 noodles. Top with some of the ricotta mixture, then some of the mushroom mixture, fontina and some of the remaining romano cheese. Season with salt and pepper. Repeat to make 3 more layers, ending with a layer of noodles, cauliflower sauce and romano. Put the dish on a baking sheet, cover with aluminum foil and bake 30 minutes. Uncover and bake until bubbly, 30 to 40 more minutes. Remove from the oven, sprinkle with parsley and let sit 15 minutes before serving. Serve with the remaining tomato sauce.";
    
    r.recipeImage = [NSData dataWithData:UIImageJPEGRepresentation([UIImage imageNamed:@"lasagna.jpg"], 1.0)];
    r.photographer = @"Johnny Miller";
    
    r = nil;
}

@end
