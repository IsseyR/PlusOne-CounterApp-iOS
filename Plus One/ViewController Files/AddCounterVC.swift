//
//  AddCounterVC.swift
//  Plus One
//
//  Created by Issey Rollison on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class AddCounterVC: UIViewController {
    
    var colour = ""
    
    @IBOutlet weak var CounterNameInput: UITextField!
    
    @IBOutlet weak var selectedColourView: UIView!
    
    @IBAction func addColours(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        switch button.tag {
        case 1:
            colour = "CounterAccentBlue"
        case 2:
            colour = "CounterAccentCoral"
        case 3:
            colour = "CounterAccentDarkAquamarine"
        case 4:
            colour = "CounterAccentPurple"
        case 5:
            colour = "CounterAccentRed"
        case 6:
            colour = "CounterAccentTeal"
        case 7:
            colour = "CounterAccentPink"
        case 8:
            colour = "CounterAccentYellow"
        default:
            colour = "CounterAccentBlue"
            print("Cant find colour?")
        }
        selectedColourView.backgroundColor = UIColor(named: "\(colour)")
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
            counterColours.insert("\(colour)", at: 0)
            UserDefaults.standard.set(counterColours, forKey: "counterColoursUserDef")
            
            // counter increment
            var counterIncrement = UserDefaults.standard.array(forKey: "counterIncrementUserDef") as! [Int]
            counterIncrement.insert(1, at: 0)
            UserDefaults.standard.set(counterIncrement, forKey: "counterIncrementUserDef")
            
            // segue
            performSegue(withIdentifier: "addCounterSegue", sender: nil)
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // keyboardDismiss
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor(named: "Background")
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboard))
        doneBtn.tintColor = .white
        
        toolbar.setItems([doneBtn], animated: true)
        
        CounterNameInput.inputAccessoryView = toolbar
        
        
        colour = "CounterAccentBlue"
        
        selectedColourView.layer.cornerRadius = 10
        // setting text view colours to white
        let white = UIColor.white
        CounterNameInput.layer.borderWidth = 1.0
        CounterNameInput.layer.borderColor = white.cgColor
        CounterNameInput.layer.cornerRadius = 7
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
