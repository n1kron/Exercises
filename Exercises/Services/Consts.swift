//
//  Consts.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 19.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class Consts {
    
    static let isIpad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    
    static let calories: [Int] = [14, 15, 17, 20, 19, 22]
    
    struct Exercises {
        static let firstExercise = ["alp", "velo" , "lunge-right", "lunge-left"]
        static let secondExercise = ["wall", "lunge-up" , "press", "plank"]
        static let thirdExercise = ["legs-right", "legs-left" , "shpagat-left", "shpagat-right"]
        static let fourthExercise = ["4-1", "4-2" , "4-3", "4-4"]
        static let fifthExercise = ["5-1", "5-2" , "5-3", "5-4", "5-5"]
        static let sixthExercise = ["6-1", "6-2" , "6-3", "6-4", "6-5"]
        
        static let exercisesNames = ["Fit in 3 min", "Workout", "Slim legs", "Endurance", "Strong Back", "Toned arms"]
        
        static let motivationTexts = ["Build muscle, strength and size at home with this plan","Workout plan to increase your metabolism and maximize fat burning","Build a stronger legs with this intense mass building workout plan","Workout plan to increase your endurance","Get a strong back with this intense mass building workout plan","Step-by-step workout plan to reinforce your arms"]
        
        static let all = [firstExercise,secondExercise,thirdExercise,fourthExercise,fifthExercise,sixthExercise]
    }
    
    static let dietData = [["Breakfast (287 calories)\n • 1 3/4 cups Muesli with Raspberries \n\n Clean-Eating Shopping Tip: When buying muesli, look for a brand that doesn't have added sugars, which take away from the healthy goodness of this whole-grain breakfast.", "A.M. Snack (35 calories)\n • 1 clementine", "Lunch (360 calories)\n • 4 cups White Bean & Veggie Salad", "P.M. Snack (42 calories)\n • 5 dried apricots", "Dinner (489 calories)\n • 1 cup Tangerine & Roasted Beet Salad with Feta & Pistachios \n • 1 serving Balsamic-Dijon Chicken \n • 1 slice sprouted-grain bread, toasted and drizzled with 1/2 tsp. olive oil.\n\n Clean-Eating Shopping Tip: Use sprouted-grain bread as your bread for these next two weeks as it's made without added sugars, unlike many store-bought breads.\n Meal-Prep Tip: Save 1 serving Balsamic-Dijon Chicken (1/2 breast) for lunch of Day 2."],
                           ["Breakfast (270 calories)\n • 1 serving Avocado-Egg Toast \n\n Clean-Eating Shopping Tip: If you plan to top your egg toast with hot sauce, look for a brand that's made without added sugars. ", "A.M. Snack (84 calories) \n • 5 dried apricots", "Lunch (342 calories)\n • 2 cups mixed greens \n • 3/4 cup veggies of your choice (try cucumbers and tomatoes)\n • 1/2 Balsamic-Dijon Chicken breast \n\n Combine ingredients and top salad with 1 Tbsp. each balsamic vinegar and olive oil.", "P.M. Snack (70 calories)\n • 2 clementines", "Dinner (439 calories)\n • 1 3/4 cup Squash & Red Lentil Curry\n • 1/2 cup Easy Brown Rice \n\n Meal-Prep Tip: Save a 1/2 cup serving of rice to have for dinner on Day 3."],
                           ["Breakfast (287 calories)\n • 1 3/4 cups Muesli with Raspberries", "A.M. Snack (162 calories)\n • 1/2 cup unsalted dry-roasted pistachios (measured in shell)", "Lunch (326 calories)\n • 1 3/4 cups Squash & Red Lentil Curry", "P.M. Snack (30 calories)\n • 1 plum", "Dinner (419 calories)\n • 1 serving Poached Cod & Green Beans with Pesto \n • 1/2 cup Easy Brown Rice tossed with 1 tsp. olive oil and seasoned with a pinch each salt & pepper. \n\n Clean-Eating Shopping Tip: Look for a pesto without added sugar or excess sodium, or make your own. Try EatingWell's Classic Basil Pesto."],
                           ["Breakfast (257 calories)\n • 1/2 cup rolled oats, cooked in 1 cup milk\n • 1 medium plum, chopped \n\n Cook oats and top with plum and a pinch of cinnamon.", "A.M. Snack (35 calories)\n • 1 clementine", "Lunch (325 calories)\n • 1 serving Veggie & Hummus Sandwich", "P.M. Snack (121 calories)/n • 5 apricot halves\n • 6 walnut halves","Dinner (458 calories)\n • 1 serving Sheet-Pan Chicken & Brussels Sprouts\n • 1 1/2 cups mixed greens dressed with 2 tsp. each olive oil & balsamic vinegar"],
                           ["Breakfast (290 calories)\n • 1 serving Peanut Butter-Banana Cinnamon Toast \n\n Clean-Eating Shopping Tip: When choosing a store-bought peanut butter, avoid brands with added sugars and trans fats. Read more about choosing a healthy peanut butter.", "A.M. Snack (60 calories)\n • 2 Tbsp. hummus\n • 1/2 cup cucumber slices", "Lunch (322 calories)\n • 4 cups White Bean & Veggie Salad", "P.M. Snack (111 calories)\n • 1/4 cup unsalted dry-roasted pistachios (measured in shell)\n • 1 plum","Dinner (400 calories)\n • 1 serving Roast Pork, Asparagus & Cherry Tomato Bowl"],
                           ["Breakfast (257 calories)\n • 1/2 cup rolled oats, cooked in 1 cup milk\n • 1 medium plum, chopped \n\n Cook oats and top with plum and a pinch of cinnamon.", "A.M. Snack (67 calories)\n • 8 dried apricots", "Lunch (325 calories)\n • 1 serving Veggie & Hummus Sandwich", "P.M. Snack (96 calories)\n • 1 plum \n • 5 walnut halves","Dinner (438 calories)\n • 1 serving Stuffed Peppers\n • 2 cups mixed greens dressed with 2 tsp. each olive oil & vinegar"],
                           ["Breakfast (307 calories)\n • 2 cups Jason Mraz's Avocado Green Smoothie", "A.M. Snack (35 calories)\n • 1 clementine", "Lunch (352 calories)\n • 2 1/4 cup Tomato, Cucumber & White-Bean Salad with Basil Vinaigrette\n • 1 slice sprouted-grain bread, toasted and topped with 1 Tbsp. hummus \n\n Meal-Prep Tip: Save a serving of the Tomato, Cucumber & White-Bean Salad with Basil Vinaigrette to have for lunch on Day 10.", "P.M. Snack (30 calories)/n • 1 plum", "Dinner (490 calories)\n • 2 1/2 cups Mexican Cabbage Soup\n • 2 cups No-Cook Black Bean Salad"]
    ]
}
