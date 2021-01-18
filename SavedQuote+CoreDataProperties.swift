//
//  SavedQuote+CoreDataProperties.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/17/21.
//
//

import Foundation
import CoreData


extension SavedQuote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedQuote> {
        return NSFetchRequest<SavedQuote>(entityName: "SavedQuote")
    }

    @NSManaged public var author: String?
    @NSManaged public var content: String?

}

extension SavedQuote : Identifiable {

}
