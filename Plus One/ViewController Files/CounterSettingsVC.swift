//
//  CounterSettingsVc.swift
//  Plus One
//
//  Created by Issey Rollison on 11/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class CounterSettingsVC: UIViewController {
    
    var colourSelected = ""
    var cellRowSelected = UserDefaults.standard.integer(forKey: "counterRowToTransfer")
    var rowColours = UserDefaults.standard.array(forKey: "counterColoursUserDef") as! [String]
    
    @IBAction func saveButton(_ sender: Any) {
        // saving data
        rowColours[cellRowSelected] = colourSelected
        UserDefaults.standard.set(rowColours, forKey: "counterColoursUserDef")
        
        // unwind segue
        performSegue(withIdentifier: "undwindFromSettings", sender: self)
        
    }
    

    @IBAction func colourSelection(_ sender: Any) {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourSelected = rowColours[cellRowSelected]
        print("row is \(colourSelected)")

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
