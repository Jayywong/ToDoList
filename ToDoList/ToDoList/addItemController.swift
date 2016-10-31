//
//  addItemController.swift
//  ToDoList
//
//  Created by Jason Wong on 10/30/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

protocol addItemControllerDelegate: class{
    func addItemToList(text:String)
}



class addItemController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    
    weak var delegate: addItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelBarButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        let tmp = itemTextField.text
        if(tmp?.characters.first == " "){ //handling text with white spaces prior to entering actual text.
            self.dismiss(animated: true, completion: nil)
        }else{
            delegate?.addItemToList(text: itemTextField.text!)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}
