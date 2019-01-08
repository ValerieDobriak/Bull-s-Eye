//
//  ViewController.swift
//  BullsEye
//
//  Created by Valeria on 12/24/18.
//  Copyright © 2018 Valeria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
  
    
    override func viewDidLoad() {  //called when the view controller first starts up
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets (top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftimage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftimage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal )
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
     
    }
	
    @IBAction func showAlert(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            score += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretti good!"
        } else {
            title = "Now even close..."
        }
        
        
        let message = "Your scored \(points) points "
        
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction (title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
            alert.addAction(action)
        
            present(alert, animated: true, completion: nil)
        
             
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
      
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
	
    }
    
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    
    func updateLabels(){
        label.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startNewGame (){
        round = 0
        score = 0
        startNewRound()
        
    }
    
   
    
    
}

