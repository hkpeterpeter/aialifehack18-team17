//
//  HomeViewController.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/17/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import Cards

let cellId = "challengeCell"

let cardGlobalX: CGFloat = 60


let feelY: CGFloat = 30
let feelTitle = "Feel the Air"
let feelItemTitle = "200 waves left"
let feelItemImageName = "feel-card"

let meditateY: CGFloat = 425
let meditateTitle = "Think Blue"
let meditateItemTitle = "Achieved!"
let meditateImageName = "meditate-card"


class HomeViewController: UICollectionViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpVC()
        
        addCard(x: cardGlobalX, y: feelY, cardTitle: feelTitle, cardItemTitle: feelItemTitle, cardImageName: feelItemImageName, cardVC: FeelDetailVC())
        
        addCard(x: cardGlobalX, y: meditateY, cardTitle: meditateTitle, cardItemTitle: meditateItemTitle, cardImageName: meditateImageName, cardVC: MeditateDetailVC())
      
    
       
        
        
    }
    
    
    // Helpers
    fileprivate func setUpVC() {
        collectionView.backgroundColor = UIColor.white
        collectionView.isScrollEnabled = true
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "hey"
            return label
        }()
        
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Subtitle Text"
            label.textColor = UIColor.blue
            return label
        }()
        
        let titleView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.blue
            
            let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
            
            if widthDiff < 0 {
                let newX = widthDiff / 2
                subtitleLabel.frame.origin.x = abs(newX)
            } else {
                let newX = widthDiff / 2
                titleLabel.frame.origin.x = newX
            }
            
            view.addSubview(titleLabel)
            view.addSubview(subtitleLabel)
            return view
        }()
        
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .none
            return formatter
        }()
        
        let todayDate = dateFormatter.string(from: Date()).uppercased()
        
        self.navigationItem.titleView = setTitle(title: "Tim's Family", subtitle: todayDate)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    
        collectionView?.register(ChallengeCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    


}

