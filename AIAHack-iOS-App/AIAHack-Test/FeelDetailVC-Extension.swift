//
//  FeelDetailVC-Extension.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/18/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import GTProgressBar

let shiftTarget: Int = 9

extension FeelDetailVC {
    
  
    
    func setupViews() {
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Activity Goal"
            label.font = UIFont.boldSystemFont(ofSize: 26)
            label.textColor = UIColor.rgb(red: 108, green: 108, blue: 108)
            return label
        }()
        
        let activityDesTextView: UITextView = {
            let textView = UITextView()
            let desString = "Leave your laptop, raise your hands on the air for at least 1000 moves per week for staying healthy, cheerful and happy"

            textView.text = desString
            textView.textColor = UIColor.rgb(red: 108, green: 108, blue: 108)
            textView.font = UIFont.systemFont(ofSize: 14)
            textView.isScrollEnabled = false
            textView.isEditable = false
            
            return textView
        }()
        
        
        let youProgressLabel: UILabel = FeelDetailVC.setProgressLabel(familyMember: "You", red: 71, green: 108, blue: 255, iconImageName: "unfilled-heart")
        
        
        
        let encouragementTextView: UITextView = {
            let textView = UITextView()
            let text = "Your family will unlock this weekly achievement with an extra of 1500 waves \n\nInvite your family to keep making waves!"
            
            let attributedText = NSMutableAttributedString(string: text, attributes: [NSMutableAttributedString.Key.foregroundColor: UIColor.rgb(red: 108, green: 108, blue: 108)])
            
            attributedText.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.rgb(red: 0, green: 7, blue: 255), range: NSRange(location: 65, length: 10))
            
            
            textView.attributedText = attributedText
           
            textView.font = UIFont.systemFont(ofSize: 14)
            
            textView.isScrollEnabled = false
            textView.isEditable = false
            return textView
        }()
        
        let wifeProgressLabel: UILabel = FeelDetailVC.setProgressLabel(familyMember: "Wife", red: 254, green: 58, blue: 99, iconImageName: "filled-heart-red")
        
        let wifeProgressBar: GTProgressBar = FeelDetailVC.setProgressBar(progress: 1, red: 254, green: 58, blue: 99)
        
        let momProgressLabel: UILabel = FeelDetailVC.setProgressLabel(familyMember: "Mom", red: 245, green: 166, blue: 35, iconImageName: "unfilled-heart")
        
        let momProgressBar: GTProgressBar = FeelDetailVC.setProgressBar(progress: 0.7, red: 245, green: 166, blue: 35)
        
        let dadProgressLabel: UILabel = FeelDetailVC.setProgressLabel(familyMember: "Dad", red: 245, green: 166, blue: 35, iconImageName: "unfilled-heart")
        
        let dadProgressBar: GTProgressBar = FeelDetailVC.setProgressBar(progress: 0.6, red: 245, green: 166, blue: 35)
  

        
        view.addSubview(titleLabel)
        view.addSubview(activityDesTextView)
        view.addSubview(youProgressLabel)
        view.addSubview(youProgressBar)
        view.addSubview(waveLabel)
        view.addSubview(encouragementTextView)
        view.addSubview(wifeProgressLabel)
        view.addSubview(wifeProgressBar)
        view.addSubview(momProgressLabel)
        view.addSubview(momProgressBar)
        view.addSubview(dadProgressLabel)
        view.addSubview(dadProgressBar)


        
        
        view.addConstraintsWith(format: "H:|-18-[v0]", views: titleLabel)
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: activityDesTextView)
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: youProgressLabel)
        view.addConstraintsWith(format: "H:|-16-[v0(343)]", views: youProgressBar)
        view.addConstraintsWith(format: "H:|-16-[v0]", views: waveLabel)
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: encouragementTextView)
        
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: wifeProgressLabel)
        view.addConstraintsWith(format: "H:|-16-[v0(343)]", views: wifeProgressBar)
        
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: momProgressLabel)
        view.addConstraintsWith(format: "H:|-16-[v0(343)]", views: momProgressBar)
        
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: dadProgressLabel)
        view.addConstraintsWith(format: "H:|-16-[v0(343)]", views: dadProgressBar)
        
        view.addConstraintsWith(format: "V:|-24-[v0]-8-[v1(90)]-12-[v2]-8-[v3(15)]-16-[v4]-16-[v5(100)]-16-[v6]-8-[v7(15)]-28-[v8]-8-[v9(15)]-28-[v10]-[v11(15)]", views: titleLabel, activityDesTextView, youProgressLabel, youProgressBar, waveLabel, encouragementTextView, wifeProgressLabel, wifeProgressBar, momProgressLabel, momProgressBar, dadProgressLabel, dadProgressBar)
    }
    
 
    
    static func setProgressLabel(familyMember: String, red: CGFloat, green: CGFloat, blue: CGFloat, iconImageName: String) -> UILabel {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: familyMember, attributes: [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: red, green: green, blue: blue), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)])
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: iconImageName)
        attachment.bounds = CGRect(x: 10, y: -2, width: 18, height: 18)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
        
        return label
        
    }
    
    static func setProgressBar(progress: CGFloat, red: CGFloat, green: CGFloat, blue: CGFloat) -> GTProgressBar {
        let progressBar = GTProgressBar()
        progressBar.progress = progress
        progressBar.barBorderColor = UIColor.rgb(red: red, green: green, blue: blue)
        progressBar.barFillColor = UIColor.rgb(red: red, green: green, blue: blue)
        progressBar.barBackgroundColor = UIColor.white
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor.rgb(red: red, green: green, blue: blue)
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return progressBar
    }
    
    
}
