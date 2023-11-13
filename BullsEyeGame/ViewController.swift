//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Cem TAŞKIN on 10.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score : Int = 0
    var round : Int = 0
 
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var lblTarget : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    @IBOutlet weak var lblRound : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentValue  = lroundf(slider.value)
        startNewRound()
        updateLabels()
        
    }
    @IBAction func showAlert (){
        
        var newScore : Int = 0
        
        if (targetValue==currentValue){
            newScore=200
        }else if (abs(targetValue-currentValue)<=5){
            newScore=150
        }else{
            newScore = 100-abs(targetValue-currentValue)
        }
        
        round+=1
        score += newScore
        
        let message = "Score : \(newScore)"
        
        let alert = UIAlertController(title: "Bulls Eye Game", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
            
        startNewRound()
        updateLabels()
    }
    @IBAction func sliderMoved (_ slider : UISlider){
        currentValue  = lroundf(slider.value)
    }
    
    func startNewRound (){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue=50;
        slider.value=Float(50)
    }
    
    func updateLabels(){
        lblTarget.text = String(targetValue)
        lblRound.text = String(round)
        lblScore.text=String(score)
    }


}

