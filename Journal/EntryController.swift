//
//  EntryController.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    var entries = [Entry]()
    
    static let sharedController = EntryController()
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        guard let indexOfEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(indexOfEntry)
    }
    
}