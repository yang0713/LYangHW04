//
//  DetailViewController.swift
//  To Do List
//
//  Created by Liuke Yang on 2/11/17.
//  Copyright © 2017 Liuke Yang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoNoteView: UITextView!
   
    
    var toDoItem: String?
    var toDoNote: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        toDoField.text = toDoItem
        toDoNoteView.text = toDoNote
        toDoField.delegate = self
        toDoField.becomeFirstResponder()
        
        if toDoItem?.characters.count == 0 || toDoItem == nil {
            saveBarButton.isEnabled = false
        } else {
            saveBarButton.isEnabled = true
            navigationItem.title = "To Do Item"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == toDoField {
            let oldString = textField.text! as NSString
            let newString = oldString.replacingCharacters(in: range, with: string) as NSString
            if newString.length == 0 {
                saveBarButton.isEnabled = false
            } else {
                saveBarButton.isEnabled = true
            }
        }
        return true
    }
    
    // MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveBarButton == sender as! UIBarButtonItem {
            toDoItem = toDoField.text
            toDoNote = toDoNoteView.text
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }

}

