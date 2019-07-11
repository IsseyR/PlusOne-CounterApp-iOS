//
//  AddCounterVC.swift
//  Plus One
//
//  Created by Issey Rollison on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class AddCounterVC: UIViewController {
    
    @IBOutlet weak var CounterNameInput: UITextField!
    
    
    @IBAction func addInputs(_ sender: Any) {
        
        if CounterNameInput.hasText {
            // saving new array to user defaults
            var counterNames = UserDefaults.standard.array(forKey: "counterNamesUserDef") as! [String]
            counterNames.insert(CounterNameInput.text!, at: 0)
            UserDefaults.standard.set(counterNames, forKey: "counterNamesUserDef")
            
            var counterValues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
            counterValues.insert(0, at: 0)
            UserDefaults.standard.set(counterValues, forKey: "counterValuesUserDef")
            
            
            // segue
            performSegue(withIdentifier: "addCounterSegue", sender: nil)
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
