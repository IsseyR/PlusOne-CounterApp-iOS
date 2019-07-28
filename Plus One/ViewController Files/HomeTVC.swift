//
//  HomeTVC.swift
//  Plus One
//
//  Created by Issey on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit
import Foundation

var homeTVCRowSelected = 0

class HomeTVC: UITableViewController {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
        
        if !isEditing {
            editButton.title = "Edit"
        } else {
            editButton.title = "Done"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var tableCellNames = UserDefaults.standard.array(forKey: "counterNamesUserDef")
    var tableCellValues = UserDefaults.standard.array(forKey: "counterValuesUserDef")
    var tableCellColours = UserDefaults.standard.array(forKey: "counterColoursUserDef")

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableCellNames != nil {
            return tableCellNames!.count
        } else {
            return 0
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath)
        
        // Configure the cell...
        
        if tableCellNames != nil {
            let name = cell.viewWithTag(2) as! UILabel
            name.text = tableCellNames?[indexPath.row] as? String
            
            let value = cell.viewWithTag(1) as! UILabel
            value.text = "\(tableCellValues![indexPath.row])"
            
            let colour = cell.viewWithTag(3) 
            colour!.backgroundColor = UIColor(named: "\(tableCellColours![indexPath.row])")

        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeTVCRowSelected = indexPath.row
        performSegue(withIdentifier: "detailedCounterViewSegue", sender:  Any?.self)
    }
    
    
    // cell size
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableCellNames = UserDefaults.standard.array(forKey: "counterNamesUserDef")
        tableCellValues = UserDefaults.standard.array(forKey: "counterValuesUserDef")
        tableCellColours = UserDefaults.standard.array(forKey: "counterColoursUserDef")
        
        tableView.reloadData()
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableCellNames?.remove(at: indexPath.row)
            UserDefaults.standard.set(tableCellNames, forKey: "counterNamesUserDef")
            self.tableCellColours?.remove(at: indexPath.row)
            UserDefaults.standard.set(tableCellColours, forKey: "counterColoursUserDef")
            self.tableCellValues?.remove(at: indexPath.row)
            UserDefaults.standard.set(tableCellValues, forKey: "counterValuesUserDef")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        editButton.title = "Done"
        
        let nameToMove = tableCellNames![sourceIndexPath.row]
        let valueToMove = tableCellValues![sourceIndexPath.row]
        let colourToMove = tableCellColours![sourceIndexPath.row]
        
        tableCellNames?.remove(at: sourceIndexPath.row)
        tableCellValues?.remove(at: sourceIndexPath.row)
        tableCellColours?.remove(at: sourceIndexPath.row)
        
        tableCellNames?.insert(nameToMove, at: destinationIndexPath.row)
        tableCellValues?.insert(valueToMove, at: destinationIndexPath.row)
        tableCellColours?.insert(colourToMove, at: destinationIndexPath.row)
        
        UserDefaults.standard.set(tableCellNames, forKey: "counterNamesUserDef")
        UserDefaults.standard.set(tableCellValues, forKey: "counterValuesUserDef")
        UserDefaults.standard.set(tableCellColours, forKey: "counterColoursUserDef")
    }

}
