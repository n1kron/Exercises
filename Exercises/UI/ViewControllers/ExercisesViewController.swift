//
//  ExercisesViewController.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 17.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class ExercisesViewController: UIViewController {

    @IBOutlet weak var exercisesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowExercise" {
            if let nextViewController = segue.destination as? DetailViewController {
                if let ex = sender as? Int {
                    nextViewController.currentPack = Consts.Exercises.all[ex]
                    nextViewController.currentTitle = Consts.Exercises.exercisesNames[ex]
                    nextViewController.startBackgroundImage = "splash\(ex+1)"
                }
            }
        }
    }
}

extension ExercisesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Consts.Exercises.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExercisesCollectionViewCell", for: indexPath) as! ExercisesCollectionViewCell
        cell.backgroundImage.image = UIImage(named: "splash\(indexPath.row + 1)")
        cell.exerciseTitle.text = Consts.Exercises.exercisesNames[indexPath.row]
        cell.motivationTitle.text = Consts.Exercises.motivationTexts[indexPath.row]
        if indexPath.row <= 1 {
            cell.difficultyImage.image = UIImage(named: "low-level")
        } else if indexPath.row <= 3 {
            cell.difficultyImage.image = UIImage(named: "medium-level")
        } else {
            cell.difficultyImage.image = UIImage(named: "hard-level")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return Consts.isIpad ? CGSize(width: UIScreen.main.bounds.size.width * 0.9 , height: UIScreen.main.bounds.size.height * 0.85) : CGSize(width: UIScreen.main.bounds.size.width * 0.9 , height: UIScreen.main.bounds.size.height * 0.77)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowExercise", sender: indexPath.row)
    }
    
    
}

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var mostRecentOffset : CGPoint = CGPoint()
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if velocity.x == 0 {
            return mostRecentOffset
        }
        if let cv = self.collectionView {
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) {
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
                    if attributes.representedElementCategory != UICollectionElementCategory.cell {
                        continue
                    }
                    if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
                        continue
                    }
                    candidateAttributes = attributes
                }
                if(proposedContentOffset.x == -(cv.contentInset.left)) {
                    return proposedContentOffset
                }
                guard let _ = candidateAttributes else {
                    return mostRecentOffset
                }
                mostRecentOffset = CGPoint(x: floor(candidateAttributes!.center.x - halfWidth), y: proposedContentOffset.y)
                return mostRecentOffset
            }
        }
        mostRecentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        return mostRecentOffset
    }
}
