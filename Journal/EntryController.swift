//
//  EntryController.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    private let keyEntries = "storedEntries"
    
    static let sharedController = EntryController()
    
    var entries = [Entry]()
    
    init() {
        loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStorage()
    }
    
    func loadFromPersistentStorage () {
        NSUserDefaults.standardUserDefaults().objectForKey(keyEntries) as? [[String: AnyObject]]
        guard let entriesDictionaries = NSUserDefaults.standardUserDefaults().objectForKey(keyEntries) as? [[String: AnyObject]] else {
            return
        }
        entries = entriesDictionaries.flatMap({Entry(dictionary: $0)})
    }
    
    func updateEntry(entry: Entry) {
        removeEntry(entry)
        addEntry(entry)
        
    }
    
    func removeEntry(entry: Entry) {
        guard let indexOfEntry = entries.indexOf(entry) else {
            return
        }
        entries.removeAtIndex(indexOfEntry)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage () {
        NSUserDefaults.standardUserDefaults().setObject(entries.map({$0.dictionaryCopy}), forKey: keyEntries)
    }
}