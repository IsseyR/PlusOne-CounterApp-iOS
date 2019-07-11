//
//  AddCounterVC.swift
//  Plus One
//
//  Created by Issey Rollison on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class AddCounterVC: UIViewController {
    
    var colourSelected = ""
    
    @IBOutlet weak var CounterNameInput: UITextField!
    
    @IBAction func addColours(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            colourSelected = "CounterAccentBlue"
        case 2:
            colourSelected = "CounterAccentCoral"
        case 3:
            colourSelected = "CounterAccentAquamarine"
        case 4:
            colourSelected = "CounterAccentPurple"
        case 5:
            colourSelected = "CounterAccentRed"
        case 6:
            colourSelected = "CounterAccentTeal"
        case 7:
            colourSelected = "CounterAccentPink"
        case 8:
            colourSelected = "CounterAccentYellow"
        default:
            colourSelected = "CounterAccentBlue"
            print("Cant find colour?")
        }
    }
    
    
    @IBAction func addInputs(_ sender: Any) {
        
        if CounterNameInput.hasText {
            // saving new array to user defaults
            
            // counter name
            var counterNames = UserDefaults.standard.array(forKey: "counterNamesUserDef") as! [String]
            counterNames.insert(CounterNameInput.text!, at: 0)
            UserDefaults.standard.set(counterNames, forKey: "counterNamesUserDef")
            
            // counter value
            var counterValues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
            counterValues.insert(0, at: 0)
            UserDefaults.standard.set(counterValues, forKey: "counterValuesUserDef")
            
            // counter colour
            var counterColours = UserDefaults.standard.array(forKey: "counterColoursUserDef") as! [String]
            counterColours.insert("\(colourSelected)", at: 0)
            UserDefaults.standard.set(counterColours, forKey: "counterColoursUserDef")
            
            // segue
            performSegue(withIdentifier: "addCounterSegue", sender: nil)
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        colourSelected = "CounterAccentBlue"
        
        
        // setting text view colours to white
        let white = UIColor.white
        CounterNameInput.layer.borderWidth = 1.0
        CounterNameInput.layer.borderColor = white.cgColor
        CounterNameInput.layer.cornerRadius = 7
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
