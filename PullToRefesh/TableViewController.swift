//
//  TableViewController.swift
//  PullToRefesh
//
//  Created by anhxa100 on 8/21/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var refresher : UIRefreshControl! // Tạo một instance của UIRefeshControl class
    
    var arrString = ["Trom cho","Trom Vang"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load tất cả dữ liệu trc khi refesh
        refresher = UIRefreshControl()
        
        //Add a refresh control to a table or collection view by assigning an instance of the UIRefreshControl class to this property
        tableView.addSubview(refresher)
        refresher.attributedTitle = NSAttributedString(string : "Pull to refresh")// add Tittle for pull icon
        refresher.addTarget(self, action: #selector(addArr), for: .valueChanged) //Adding a Target and Action
        refresher.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
    }
    
    //
    @objc func addArr() {
        refresher.beginRefreshing()
        let add = ["Le Van Luyen","Hiep Dam"]
        arrString += add
        tableView.reloadData()
        refresher.endRefreshing() //End of refesh
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrString.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = arrString[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
