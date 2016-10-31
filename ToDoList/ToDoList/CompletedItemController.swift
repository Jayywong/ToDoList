//
//  CompletedItemController.swift
//  ToDoList
//
//  Created by Jason Wong on 10/30/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit


class CompletedItemController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var completedList: [Int:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return completedList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedItemCell", for: indexPath)
        cell.textLabel?.text = completedList[indexPath.row]
        return cell
    }


}
