//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    func updateWith(entry: Entry) {
        entryTitleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.entryTitleTextField.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entryTitleTextField.delegate = self
        bodyTextView.delegate = self
        
        if let entry = entry {
            updateWith(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBActions
    
    @IBAction func clearTextButtonPressed(sender: AnyObject) {
        entryTitleTextField.text = ""
        bodyTextView.text = ""
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let entry = entry {
            updateWith(entry)
        } else {
            guard let title = entryTitleTextField.text, bodyText = bodyTextView.text else {
                return
            }
            let entry = Entry(timestamp: NSDate(), title: title, bodyText: bodyText)
            EntryController.sharedController.addEntry(entry)
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }

}
