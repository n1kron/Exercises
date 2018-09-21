//
//  FinishView.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 20.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

protocol FinishDelegate: class {
    func continueSelected()
}

class FinishView: UIView {
    @IBOutlet weak var finishLabel: UILabel!
    weak var delegate: FinishDelegate?
    
    @IBAction func continueAction(_ sender: UIButton) {
        delegate?.continueSelected()
    }
}
