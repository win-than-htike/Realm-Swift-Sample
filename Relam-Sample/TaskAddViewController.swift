//
//  TaskAddViewController.swift
//  Relam-Sample
//
//  Created by Win Than Htike on 11/17/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit
import RealmSwift

class TaskAddViewController: UIViewController {

    @IBOutlet weak var tfTaskName: UITextField!
    
    private var isUpdate = false
    
    var task : Task?
    
    private var taskId : String = ""
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let task = task {
            tfTaskName.text = task.name
            self.taskId = task.id
            isUpdate = true
        } else {
            tfTaskName.text = ""
            isUpdate = false
        }
        
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        
        if isUpdate {
            
            if !tfTaskName.text!.isEmpty {
                
                let task = realm.objects(Task.self).filter(NSPredicate(format: "id = %@", taskId)).first
                
                try! realm.write {
                    
                    task?.name = tfTaskName.text!
                    self.navigationController?.popViewController(animated: true)
                    
                }
                
            } else {
                print("Task is Emplty!")
            }
            
        } else {
            
            if !tfTaskName.text!.isEmpty {
                
                let task = Task(name: tfTaskName.text!)
                
                try! realm.write {
                    
                    realm.add(task)
                    self.navigationController?.popViewController(animated: true)
                    
                }
                
            } else {
                print("Task is Emplty!")
            }
            
        }
        
    }
    
}
