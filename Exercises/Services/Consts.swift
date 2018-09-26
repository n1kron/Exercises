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
    
    struct Exercises {
        static let firstExercise = ["alp", "velo" , "lunge-right", "lunge-left"]
        static let secondExercise = ["wall", "lunge-up" , "press", "plank"]
        static let thirdExercise = ["legs-right", "legs-left" , "shpagat-left", "shpagat-right"]
        static let fourthExercise = ["4-1", "4-2" , "4-3", "4-4"]
        static let fifthExercise = ["5-1", "5-2" , "5-3", "5-4", "5-5"]
        static let sixthExercise = ["6-1", "6-2" , "6-3", "6-4", "6-5"]
        
        static let exercisesNames = ["Fit in 3 min", "Workout", "Slim legs", "Endurance", "Strong Back", "Toned arms and breasts"]
        
        static let motivationTexts = ["Build muscle, strength and size at home with this plan","Workout plan to increase your metabolism and maximize fat burning","Build a stronger legs with this intense mass building workout plan","Workout plan to increase your endurance","Get a strong back with this intense mass building workout plan","Step-by-step workout plan to reinforce your arms"]
        
        static let all = [firstExercise,secondExercise,thirdExercise,fourthExercise,fifthExercise,sixthExercise]
    }
}
