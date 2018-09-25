//
//  StartView.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 18.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class StartView: UIView {
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var timeCount:Int = 4
    var timer:Timer!
    
    override func awakeFromNib() {
        if timer != nil {
            timer.invalidate()
        }
        backgroundImage.contentMode = .scaleAspectFill
        
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc func timerDidFire() {
        timeCount -= 1
        centerLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        if timeCount == 0 {
            timer.invalidate()
            self.removeFromSuperview()
        }
        
        UIView.animate(withDuration: 1.0) {
            self.centerLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.centerLabel.text = NSString(format: "%2d", self.timeCount%60) as String
        }
    }
}
