//
//  Outburst+CoreDataProperties.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/10/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//
//

import Foundation
import CoreData


extension Outburst {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Outburst> {
        return NSFetchRequest<Outburst>(entityName: "Outburst")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var date: Date?

}

extension Outburst : Identifiable {

}
