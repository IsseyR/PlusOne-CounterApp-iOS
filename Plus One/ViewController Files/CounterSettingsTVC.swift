//
//  CounterSettingsTVC.swift
//  Plus One
//
//  Created by Issey Rollison on 17/11/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class CounterSettingsTVC: UITableViewController {
    
    @IBOutlet var counterNameEntry: UITextField!
    @IBOutlet var counterValueEntry: UITextField!
    @IBOutlet var counterIncrementEntry: UITextField!
    
    @IBOutlet var counterNameLabel: UILabel!
    @IBOutlet var counterValueLabel: UILabel!
    @IBOutlet var counterIncrementLabel: UILabel!
    
    let cellRowSelected = homeTVCRowSelected
    var counterColours = UserDefaults.standard.array(forKey: "counterColoursUserDef") as! [String]
    var counterNames = UserDefaults.standard.array(forKey: "counterNamesUserDef") as! [String]
    var countervalues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
    var counterIncrement = UserDefaults.standard.array(forKey: "counterIncrementUserDef") as! [Int]
    var colour = String()
    var name = String()
    var value = Int()
    var increment = Int()
    
    
    @IBAction func saveButton(_ sender: Any) {
        // saving data
        
        // saving colour
        counterColours[cellRowSelected] = colour
        UserDefaults.standard.set(counterColours, forKey: "counterColoursUserDef")
        
        print("save")
        
        if counterNameEntry.hasText {
            // saving name
            name = counterNameEntry.text!
            counterNames[cellRowSelected] = name
            UserDefaults.standard.set(counterNames, forKey: "counterNamesUserDef")
            print("Name condion met")
        }
        
        if counterValueEntry.hasText && counterValueEntry.text!.count < 5 {
            // saving value
            value = Int(counterValueEntry.text!)!
            countervalues[cellRowSelected] = value
            UserDefaults.standard.set(countervalues, forKey: "counterValuesUserDef")
            print("Value condion met")

        }
        
        if counterIncrementEntry.hasText {
            increment = Int(counterIncrementEntry.text!)!
            counterIncrement[cellRowSelected] = increment
            UserDefaults.standard.set(counterIncrement, forKey: "counterIncrementUserDef")
            print("Increment condion met")

        }
        
        // unwind segue
        performSegue(withIdentifier: "undwindToCounterVCWithSegue", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // setting values
        value = countervalues[cellRowSelected]
        name = counterNames[cellRowSelected]
        colour = counterColours[cellRowSelected]
        increment = counterIncrement[cellRowSelected]
                
        // dismiss keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor(named: "Background")
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboard))
        doneBtn.tintColor = .white
        
        toolbar.setItems([doneBtn], animated: true)
        
        counterNameEntry.inputAccessoryView = toolbar
        counterValueEntry.inputAccessoryView = toolbar
        counterIncrementEntry.inputAccessoryView = toolbar
        
        // setting Text
        counterValueEntry.text = String(value)
        counterNameEntry.text = name
        counterIncrementEntry.text = String(increment)
        
        // set theme
        counterNameLabel.textColor = PublicData.textColour
        counterValueLabel.textColor = PublicData.textColour
        counterIncrementLabel.textColor = PublicData.textColour
        self.view.backgroundColor = UIColor(named: "\(PublicData.theme ?? "Dark")Background")
        
        
        print("colour: \(colour)")
        print("name: \(name)")
        print("value: \(value)")
        print("Increment: \(increment)")
        
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
