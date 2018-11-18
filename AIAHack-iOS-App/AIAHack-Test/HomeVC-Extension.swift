//
//  HomeVC-Extension.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/18/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import Cards

extension HomeViewController {
    
    func addCard(x: CGFloat, y: CGFloat, cardTitle: String, cardItemTitle: String, cardImageName: String, cardVC: UIViewController) {
        let card = CardHighlight(frame: CGRect(x: x, y: y, width: 300, height: 360))
        card.backgroundColor = UIColor(red: 0, green: 94/255, blue: 112/255, alpha: 1)
        card.backgroundImage = UIImage(named: cardImageName)
        card.title = cardTitle
        card.itemTitle = cardItemTitle
        card.itemSubtitle = ""
        card.textColor = UIColor.white
        
        let detailVC = cardVC
        // Or init a new one and programmatically design its view
        card.shouldPresent(detailVC, from: self)
        
        view.addSubview(card)
    }

    func setTitle(title:String, subtitle:String) -> UIView {
        
        //Get navigation Bar Height and Width
        let navigationBarHeight = Int(self.navigationController!.navigationBar.frame.height)
        let navigationBarWidth = Int(self.navigationController!.navigationBar.frame.width)
        
        //Y position for Title and Subtitle
        var y_Title = 0.0
        var y_SubTitle = 0.0
        
        //Set Y position
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            //If screen height equal iPhone 5S and SE
            case 1136:
                y_Title = 46
                y_SubTitle = 36
                print("iPhone 5S and SE")
            //If screen height equal iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X
            case 1334, 1920, 2208, 2436:
                y_Title = 48
                y_SubTitle = 38
                print("iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X")
            default:
                y_Title = 46
                y_SubTitle = 36
                print("Default")
            }
        }
        
        //Set Font size and weight for Title and Subtitle
        let titleFont = UIFont.systemFont(ofSize: 33, weight: UIFont.Weight.bold)
        let subTitleFont = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        
        //Title label
        let titleLabel = UILabel(frame: CGRect(x: 8.5, y: y_Title, width: 0, height: 0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.black
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        //SubTitle label
        let subtitleLabel = UILabel(frame: CGRect(x: 8.5, y: y_SubTitle, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.gray
        subtitleLabel.font = subTitleFont
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        //Add Title and Subtitle to View
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: navigationBarWidth, height: navigationBarHeight))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        return titleView
    }
    
    
}
