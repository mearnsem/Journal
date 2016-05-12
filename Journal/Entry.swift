//
//  Entry.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    init(timestamp: NSDate, title: String, bodyText: String) {
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
    
    //Write a dictionaryCopy function that returns a Dictionary with keys and values matching the properties of the object.
    
//    func dictionaryCopy {
//        
//    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}