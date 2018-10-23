//
//  InformationViewController.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 02/10/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        infoTextView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }
}
