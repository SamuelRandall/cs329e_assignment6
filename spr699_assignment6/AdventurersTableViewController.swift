//
//  AdventurersTableViewController.swift
//  spr699_assignment6
//
//  Created by Slijepcevic, Milica on 3/24/19.
//  Copyright © 2019 Samuel Randall. All rights reserved.
//

import UIKit
import CoreData


class AdventurersTableViewController: UITableViewController {
    
    var list: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "Adv")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Adventurer")
        var response: [NSManagedObject]? = nil
        
        do {
            response = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if let response = response {
            self.list = response
            
        }
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let adv = list[indexPath.row]
            
            let cell  = tableView.dequeueReusableCell(withIdentifier: "Adv", for: indexPath) as! TableViewCell
            //cell.textLabel?.text = adv.value(forKeyPath: "name") as? String
            //cell.imageView?.image = UIImage(named: headline.name)
            //cell.textLabel?.text = adv.value(forKeyPath: "name") as? String
            cell.nameLabel?.text = adv.value(forKeyPath: "name") as? String
            cell.professionLabel?.text = adv.value(forKeyPath: "profession") as? String
            cell.levelLabel?.text = adv.value(forKeyPath: "level") as? String
            cell.HPLabel?.text = adv.value(forKeyPath: "totalHP") as? String
            cell.attackLabel?.text = adv.value(forKeyPath: "attack") as? String
            
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


