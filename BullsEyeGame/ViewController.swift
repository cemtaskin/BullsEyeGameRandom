//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Cem TAŞKIN on 10.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var currentValue : Int = 0
    @IBOutlet weak var slider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentValue  = lroundf(slider.value)
    }
    
    @IBAction func showAlert (){
        let message = "The value of slider is :\(currentValue)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved (_ slider : UISlider){
        currentValue  = lroundf(slider.value)
    }


}

