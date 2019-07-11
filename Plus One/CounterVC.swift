//
//  CounterVC.swift
//  Plus One
//
//  Created by Issey Rollison on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class CounterVC: UIViewController {

    @IBOutlet weak var counterNameDetailed: UILabel!
    var cellRowSelected  = UserDefaults.standard.integer(forKey: "counterValueToTransfer")
    var counterValues = UserDefaults.standard.array(forKey: "counterValuesUserDef") as! [Int]
    var arrayOffset = 0
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        arrayOffset = counterValues[cellRowSelected]
        counterNameDetailed.text = String(arrayOffset)
        
        // gesture recognisers
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeUp.direction = .up
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .up:
                arrayOffset += 1
                print(arrayOffset)
            case .down:
                arrayOffset -= 1
                print(arrayOffset)
            default:
                print("error")
            }
            counterNameDetailed.text = String(arrayOffset)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        counterValues[cellRowSelected] = arrayOffset
        UserDefaults.standard.set(counterValues, forKey: "counterValuesUserDef")
        print("done")
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
