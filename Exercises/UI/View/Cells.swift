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
    @IBOutlet weak var difficultyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundColor = .clear
        
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false

    }
}

class DietTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodImage.layer.cornerRadius = 10.0
    }
}
