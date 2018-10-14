//
//  DietViewController.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 13/10/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class DietViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var day = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
    }

    @IBAction func segmentDaysAction(_ sender: Any) {
        day = segmentControl.selectedSegmentIndex
        tableView.reloadData()
    }
}

extension DietViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Consts.dietData[day].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DietTableViewCell", for: indexPath) as! DietTableViewCell
        
        cell.foodImage.image = UIImage(named: "\(day)-\(indexPath.row)")
        cell.titleLabel.text = Consts.dietData[day][indexPath.row]
        return cell
    }
    
    
}
