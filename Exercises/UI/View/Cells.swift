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
    @IBOutlet weak var motivationTitle: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.contentMode = .scaleAspectFill
        
        layer.cornerRadius = 10.0
        layer.masksToBounds = true

    }
}
