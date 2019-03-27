//
//  AddViewController.swift
//  spr699_assignment6
//
//  Created by Slijepcevic, Milica on 3/24/19.
//  Copyright © 2019 Samuel Randall. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    
//    var list: [NSManagedObject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var classText: UITextField!
    
    
    @IBAction func save(_ sender: UIButton) {
        
        let name = nameText.text ?? ""
        let profession = classText.text ?? ""
        
        if (name != "") && (profession != ""){
            let hp = Int.random(in: 0 ... 10)
            let att = Float.random(in: 0 ... 10)
            self.addAdv(name: name, profession: profession, level: 1, HP: hp, attack: att)
        }
        
    }
    
    
    func addAdv(name: String, profession: String, level: Int, HP: Int, attack: Float) {
        
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Adventurer",
                                       in: managedContext)!

        let adv = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        
        adv.setValue(name, forKey: "name")
        adv.setValue(profession, forKey: "profession")
        adv.setValue(level, forKey: "level")
        adv.setValue(HP, forKey: "totalHP")
        adv.setValue(attack, forKey: "attack")
        
        do {
            try managedContext.save()
//            list.append(adv)
            print("is saved")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        } catch {
            print(error.localizedDescription)
        }
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
