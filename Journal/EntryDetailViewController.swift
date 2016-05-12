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
        title = entry.title
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
        
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let entry = entry {
            updateWith(entry)
        } else {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
