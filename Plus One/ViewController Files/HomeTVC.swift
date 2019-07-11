//
//  HomeTVC.swift
//  Plus One
//
//  Created by Issey Rollison on 8/7/19.
//  Copyright © 2019 Issey. All rights reserved.
//

import UIKit
import Foundation

class HomeTVC: UITableViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("testing")
        if tableCellNames != nil {
            print(tableCellNames!.count)
        }
        else {
            print("nil")
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    var tableCellNames = UserDefaults.standard.array(forKey: "counterNamesUserDef")
    var tableCellValues = UserDefaults.standard.array(forKey: "counterValuesUserDef")
    var tabelCellColours = UserDefaults.standard.array(forKey: "counterColoursUserDef")

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableCellNames != nil {
            return tableCellNames!.count
        }
        else {
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
            
            let colour = cell.viewWithTag(3) as! UIView
            colour.backgroundColor = UIColor(named: "\(tabelCellColours![indexPath.row])")

        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "counterRowToTransfer")
        print(indexPath.row)
        performSegue(withIdentifier: "detailedCounterViewSegue", sender:  Any?.self)
    }
    
    
    
    
    
    // cell size
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableCellNames = UserDefaults.standard.array(forKey: "counterNamesUserDef")
        tableCellValues = UserDefaults.standard.array(forKey: "counterValuesUserDef")
        tabelCellColours = UserDefaults.standard.array(forKey: "counterColoursUserDef")
        
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
            self.tabelCellColours?.remove(at: indexPath.row)
            UserDefaults.standard.set(tabelCellColours, forKey: "counterColoursUserDef")
            self.tableCellValues?.remove(at: indexPath.row)
            UserDefaults.standard.set(tableCellValues, forKey: "counterValuesUserDef")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
