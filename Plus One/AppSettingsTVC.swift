//
//  AppSettingsTVC.swift
//  Plus One
//
//  Created by Issey Rollison Rollison on 16/11/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit

class AppSettingsTVC: UITableViewController {
    
    @IBOutlet var themeSwitchOutlet: UISwitch!
    @IBOutlet var hapticsSwitchOutlet: UISwitch!
    @IBOutlet var audioSwitchOutlet: UISwitch!
    
    let themeSwitchOn = PublicData.theme == "Dark" ? true : false
    
    @IBAction func doneButton(_ sender: Any) {
        performSegue(withIdentifier: "undwindFromAppSettings", sender: nil)
    }
    
    @IBAction func optionSwitches(_ sender: Any) {
        
        guard let switches = sender as? UISwitch else {
            return
        }
        
        switch switches.tag {
        case 0:
            if themeSwitchOutlet.isOn {
                UserDefaults.standard.set("Dark", forKey: "colourTheme")
            } else {
                UserDefaults.standard.set("Light", forKey: "colourTheme")
            }
            PublicData.updateData()
            changeTheme()
        case 1:
            if hapticsSwitchOutlet.isOn {
                UserDefaults.standard.set(true, forKey: "hasHaptics")
            } else {
                UserDefaults.standard.set(false, forKey: "hasHaptics")
            }
        case 2:
            if audioSwitchOutlet.isOn {
                UserDefaults.standard.set(true, forKey: "hasAudio")
            } else {
                UserDefaults.standard.set(false, forKey: "hasAudio")
            }
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Removing back button
        self.navigationItem.hidesBackButton = true
        
        // Set switch states
        themeSwitchOutlet.setOn(themeSwitchOn, animated: false)
        
        // Set theme
        changeTheme()
        
    }
    
    
    func changeTheme() {
        self.view.backgroundColor = UIColor(named: "\(PublicData.theme ?? "Dark")Background")
        self.navigationController?.navigationBar.tintColor = PublicData.textColour
        self.navigationController?.navigationBar.largeTitleTextAttributes = PublicData.titleAttributes
        self.navigationController?.navigationBar.titleTextAttributes = PublicData.titleAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "\(PublicData.theme ?? "Dark")Background")
        
    }
}
