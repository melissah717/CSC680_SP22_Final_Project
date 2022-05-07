//
//  JournalItem+CoreDataProperties.swift
//  iTinerary
//
//  Created by Ze Lei on 5/6/22.
//
//

import Foundation
import CoreData


extension JournalItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalItem> {
        return NSFetchRequest<JournalItem>(entityName: "JournalItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var desc: String?
    @NSManaged public var name: String?

}

extension JournalItem : Identifiable {

}
