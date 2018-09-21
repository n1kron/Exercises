//
//  Cells.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 17.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class ExercisesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var exerciseTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
}
