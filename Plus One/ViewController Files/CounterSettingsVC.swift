//
//  CounterSettingsVc.swift
//  Plus One
//
//  Created by Issey on 11/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class CounterSettingsVC: UIViewController {
    
    var cellRowSelected = homeTVCRowSelected
    var counterColours = UserDefaults.standard.array(forKey: "counterColoursUserDef") as! [String]
    var counterNames = UserDefaults.standard.array(forKey: "counterNamesUserDef") as! [String]
    var countervalues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
    var colour = ""
    var name = ""
    var value = 0
    
    @IBOutlet weak var selectedColourView: UIView!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var valueInput: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        // saving data
        
        // saving colour
        counterColours[cellRowSelected] = colour
        UserDefaults.standard.set(counterColours, forKey: "counterColoursUserDef")
        
        if nameInput.hasText {
             // saving name
            name = nameInput.text!
            counterNames[cellRowSelected] = name
            UserDefaults.standard.set(counterNames, forKey: "counterNamesUserDef")
        }
        
        if valueInput.hasText && valueInput.text!.count < 5 {
            // saving value
            value = Int(valueInput.text!)!
            countervalues[cellRowSelected] = value
            UserDefaults.standard.set(countervalues, forKey: "counterValuesUserDef")
        }
        // unwind segue
        performSegue(withIdentifier: "undwindFromSettings", sender: self)
        
    }
    

    @IBAction func colourSelection(_ sender: Any) {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //setting values
        value = countervalues[cellRowSelected]
        name = counterNames[cellRowSelected]
        colour = counterColours[cellRowSelected]
        
        // dismiss keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor(named: "Background")
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.dismissKeyboard))
        doneBtn.tintColor = .white
        
        toolbar.setItems([doneBtn], animated: true)
        
        nameInput.inputAccessoryView = toolbar
        valueInput.inputAccessoryView = toolbar
        
        // setting text fields
        let white = UIColor.white
        nameInput.layer.borderWidth = 1.0
        nameInput.layer.borderColor = white.cgColor
        nameInput.layer.cornerRadius = 7
        
        valueInput.layer.borderWidth = 1.0
        valueInput.layer.borderColor = white.cgColor
        valueInput.layer.cornerRadius = 7
        
        
        nameInput.text = name
        valueInput.text = String(value)
    
        
        print("colour: \(colour)")
        print("name: \(name)")
        print("value: \(value)")
        
        
        selectedColourView.layer.cornerRadius = 10
        DispatchQueue.main.async {
            self.selectedColourView.backgroundColor = UIColor(named: "\(self.colour)")
        }
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
