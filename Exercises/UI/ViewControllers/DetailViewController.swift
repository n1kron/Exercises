//
//  ExerciseViewController.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 17.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit
import SRCountdownTimer

class DetailViewController: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var restLabel: UILabel!
    @IBOutlet weak var timeToRestLabel: UILabel!
    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var repetitionLabel: UILabel!
    @IBOutlet weak var startView: StartView!
    @IBOutlet weak var finishView: FinishView!
    @IBOutlet weak var circleTimer: SRCountdownTimer!
    
    var timer:Timer!
    var startCount = 0
    var timeCount: Int = 15
    var currentPack: [String] = []
    var currentTitle = ""
    var startBackgroundImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: currentPack[startCount])
        exerciseTitle.text = currentTitle
        circleTimer.lineColor = .gray
        circleTimer.lineWidth = 4.0
        circleTimer.isLabelHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        startView.frame.size = view.frame.size
        startView.backgroundImage.image = UIImage(named: startBackgroundImage)
        finishView.delegate = self
        finishView.frame.size = view.frame.size
        finishView.alpha = 0.0
        view.addSubview(startView)
    }

    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if !gifImageView.isHidden {
            if startCount == currentPack.count - 1 {
                view.addSubview(finishView)
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.finishView.alpha = 1.0
                }
                return
            }
            progressView.progress += currentPack.count == 4 ? 0.25 : 0.2
            gifImageView.isHidden = true
            progressView.isHidden = true
            repetitionLabel.isHidden = true
            timeToRestLabel.isHidden = false
            circleTimer.isHidden = false
            restLabel.isHidden = false
            circleTimer.start(beginingValue: 15, interval: 1)
            timer = Timer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        } else {
            exerciseIsOver()
        }
    }
    
    @objc func timerDidFire() {
        timeCount -= 1
        if timeCount == 0 {
            exerciseIsOver()
        }
        restLabel.text = NSString(format: "%02d:%02d",(timeCount/60)%60,timeCount%60) as String
    }
    
    func exerciseIsOver () {
        timer.invalidate()
        startCount += 1
        gifImageView.loadGif(name: currentPack[startCount])
        gifImageView.isHidden = false
        progressView.isHidden = false
        repetitionLabel.isHidden = false
        circleTimer.isHidden = true
        timeToRestLabel.isHidden = true
        restLabel.isHidden = true
        restLabel.text = "00:15"
        timeCount = 15
    }
}

extension DetailViewController: FinishDelegate {
    func continueSelected() {
        dismiss(animated: true, completion: nil)
    }
}
