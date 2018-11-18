//
//  FeelDetailVC.swift
//  AIAHack-Test
//
//  Created by Tim Ng on 11/18/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit
import GTProgressBar
import CoreMotion


var isAccNormal: Bool!
let initialWave: Int = 800
let targetWave: Int = 1000
var currentWave: Int = initialWave

var wavesLeft: Int = 200

var waveLabel: UILabel!

class FeelDetailVC: UIViewController {
    
    // MARK:- Properties
    var youProgressBar: GTProgressBar = FeelDetailVC.setProgressBar(progress: 0.8, red: 71, green: 108, blue: 255)
    
    
    
    var motionManager = CMMotionManager()
  
  
    
    var youWaveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waveLabel = setWaveLabel(currentWave: initialWave, targetWave: targetWave)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureMotion()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        endMotionListening()
    }
    
    fileprivate func configureMotion() {
        motionManager.accelerometerUpdateInterval = 1.0
        if let currentQueue = OperationQueue.current {

            motionManager.startAccelerometerUpdates(to: currentQueue) { (data, error) in
                if let data = data {
                    if data.acceleration.x >= 1 || data.acceleration.x <= -1 {
                        isAccNormal = true
                        print("<GO>")
                        
                        DispatchQueue.main.async {
                            self.updateWaveValues(isAccNormal: isAccNormal)
                        }
                        
                        
                    }
                    
                }
            }
        }
        
    }
    
    
    
    fileprivate func endMotionListening() {
        motionManager.stopAccelerometerUpdates()
        
    }
    
    fileprivate func updateWaveValues(isAccNormal: Bool) {
        if isAccNormal == true {
            currentWave += 1
            wavesLeft -= 1
            print("currentWave: \(currentWave)")
            waveLabel.text = "\(currentWave) waves completed, \(targetWave) to go"
            
        }
    }
    
    func setWaveLabel(currentWave: Int, targetWave: Int) -> UILabel {
        let label = UILabel()
        let labelText = "\(currentWave) waves completed, \(targetWave) to go"
        print("labelText: \(labelText)")
        label.text = labelText
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.rgb(red: 71, green: 108, blue: 255)
        return label
    }
}
