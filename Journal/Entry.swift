//
//  Entry.swift
//  Journal
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [timestampKey: timestamp, titleKey: title, bodyTextKey: bodyText]
    }
    
    init(timestamp: NSDate, title: String, bodyText: String) {
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary[timestampKey] as? NSDate, title = dictionary[titleKey] as? String, bodyText = dictionary[bodyTextKey] as? String else {
            return nil
        }
        self.timestamp = timestamp
        self.title = title
        self.bodyText = bodyText
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}