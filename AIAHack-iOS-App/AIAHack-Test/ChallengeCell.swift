//
//  ChallengeCell.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/17/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

class ChallengeCell: UICollectionViewCell {
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        
        let attributedText = NSMutableAttributedString(string: "Get up and Go", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.foregroundColor: UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n1,000 steps left", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    let coverImageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 14
        
        view.image = UIImage(named: "jogging-card")
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        
        
        return view
    }()
    
    let overlayView: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 14
        view.backgroundColor = UIColor.blue
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
       
        view.layer.addSublayer(layer)
        
        return view
    }()
    
    
    fileprivate func setupViews() {
        
        
        
//        layer.masksToBounds = true
        
        layer.cornerRadius = 14
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 10
        
        
        
        addSubview(coverImageView)
        addSubview(overlayView)
        addSubview(titleLabel)
        
        addConstraintsWith(format: "H:|[v0]|", views: coverImageView)
        addConstraintsWith(format: "H:|[v0]|", views: overlayView)
        addConstraintsWith(format: "H:|-8-[v0]|", views: titleLabel)
        
        addConstraintsWith(format: "V:|[v0]|", views: coverImageView)
        addConstraintsWith(format: "V:|[v0]|", views: coverImageView)
        addConstraintsWith(format: "V:[v0]-8-|", views: titleLabel)
        
        
        
    }
    
}
