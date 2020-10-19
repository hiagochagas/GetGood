//
//  Outburst+CoreDataClass.swift
//  GetGood
//
//  Created by Hiago Chagas on 16/10/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Outburst)
public class Outburst: NSManagedObject {
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Outburst] {
        let request : NSFetchRequest<Outburst> = Outburst.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        guard let Outbursts = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return Outbursts
    }
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        Outburst.fetchAll(viewContext: viewContext).forEach({ viewContext.delete($0) })
        try? viewContext.save()
    }
}
