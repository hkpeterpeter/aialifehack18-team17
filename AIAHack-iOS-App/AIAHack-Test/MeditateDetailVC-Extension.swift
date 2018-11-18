//
//  MeditateDetailVC-Extension.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/18/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import Cards


extension MeditateDetailVC {
    
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
            let desString = "Meditate your success away! Meditate for 60 minutes each week to stay in focus, collected and mindful"
           
            //            let targetIndex = desString.firstIndex(of: "2")
            
            //            let attributeText = NSMutableAttributedString(string: desString, attributes: nil)
            //            attributeText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.rgb(red: 107, green: 48, blue: 223), range: NSRange(location: 30, length: 3))
            
            textView.text = desString
            textView.textColor = UIColor.rgb(red: 108, green: 108, blue: 108)
            textView.font = UIFont.systemFont(ofSize: 14)
            textView.isScrollEnabled = false
            textView.isEditable = false
            
            
            return textView
        }()
        
        let progressLabel: UILabel = {
            let label = UILabel()
            
            let attributedText = NSMutableAttributedString(string: "You", attributes: [NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 71, green: 108, blue: 255), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21)])
            
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "unfilled-heart")
            attachment.bounds = CGRect(x: 10, y: -2, width: 18, height: 18)
            attributedText.append(NSAttributedString(attachment: attachment))
            
            label.attributedText = attributedText
            
            return label
        }()
        
        
        
        let encouragementTextView: UITextView = {
            let textView = UITextView()
            let text = "Your family will unlock this weekly achievement with an extra of 1500 waves \n\nInvite your family to keep moving!"
            
            return textView
        }()
        
        
        view.addSubview(titleLabel)
        view.addSubview(activityDesTextView)
        view.addSubview(progressLabel)
 
        view.addSubview(waveLabel)
        
        
        
        view.addConstraintsWith(format: "H:|-18-[v0]", views: titleLabel)
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: activityDesTextView)
        view.addConstraintsWith(format: "H:|-16-[v0]|", views: progressLabel)
        
        view.addConstraintsWith(format: "H:|-16-[v0(343)]", views: waveLabel)
        
        view.addConstraintsWith(format: "V:|-24-[v0]-8-[v1(100)]-12-[v2]-8-[v3(15)]", views: titleLabel, activityDesTextView, progressLabel, waveLabel)
    }
    
    static func setWaveLabel(initialWave: Int, targetWave: Int) -> UILabel {
        let label = UILabel()
        let labelText = "\(initialWave) completed, \(targetWave) to go"
        label.text = labelText
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.rgb(red: 71, green: 108, blue: 255)
        return label
    }
    
    
}

