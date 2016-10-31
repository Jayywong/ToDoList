//
//  ViewController.swift
//  ToDoList
//
//  Created by Jason Wong on 10/21/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addItemControllerDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var toDoList: NSMutableArray = ["do homework","watch movie","make app"]
    
    var completedList: [Int:String] = [:]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        removeAccessoryType()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoList.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath as IndexPath)
        cell.textLabel?.text = toDoList[indexPath.row] as! String
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func removeAccessoryType(){
        for row in 0..<toDoList.count{
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)){
                cell.accessoryType = .none
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .none{
                cell.accessoryType = .checkmark
                completedList[completedList.count] = toDoList[indexPath.row] as! String
                toDoList.removeObject(at: indexPath.row)
            }else{
                cell.accessoryType = .none
            }
            
        }
    }
    
    func addItemToList(text:String){
        toDoList[toDoList.count] = text
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddItemSegue") {
            let navagationController = segue.destination as! UINavigationController
            let addItemViewController = navagationController.topViewController as! addItemController
            addItemViewController.delegate = self
        }else if(segue.identifier == "CompletedItemSegue"){
            let completedItemController = segue.destination as! CompletedItemController
            completedItemController.completedList = completedList as! [Int:String]
        }
}
}

