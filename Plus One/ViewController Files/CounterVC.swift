//
//  CounterVC.swift
//  Plus One
//
//  Created by Issey on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit
import AudioToolbox

class CounterVC: UIViewController {
    
    @IBAction func settingsButton(_ sender: Any) {
        counterValues[cellRowSelected] = arrayOffset
        UserDefaults.standard.set(counterValues, forKey: "counterValuesUserDef")
        
        performSegue(withIdentifier: "counterSettingsSegue", sender: nil)
    }
    
    @IBAction func undwindToCounterVC(segue:UIStoryboardSegue) { }

    @IBOutlet weak var counterNameDetailed: UILabel!
    var cellRowSelected = homeTVCRowSelected
    var counterValues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
    var arrayOffset = 0
    
  
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .up:
                arrayOffset += 1
            case .down:
                arrayOffset -= 1
            default:
                print("error")
            }
            AudioServicesPlaySystemSound(1519)
            counterNameDetailed.text = String(arrayOffset)
            print(arrayOffset)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        counterValues[cellRowSelected] = arrayOffset
        UserDefaults.standard.set(counterValues, forKey: "counterValuesUserDef")
    }

    override func viewWillAppear(_ animated: Bool) {
        counterValues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
        arrayOffset = counterValues[cellRowSelected]
        counterNameDetailed.text = String(arrayOffset)
        self.title = UserDefaults.standard.array(forKey: "counterNamesUserDef")![homeTVCRowSelected] as? String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // gesture recognisers
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeUp.direction = .up
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
    }
}
