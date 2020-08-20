//
//  OutburstRepository.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import Foundation

class Outburst: Codable{
    let id: UUID
    var text: String?
    
    init(id: UUID = UUID(), text: String? = nil) {
        self.id = id
        self.text = text
    }
}

class OutburstRepository: Codable{
    var items: [Outburst] = []
    
    func createNewItem() -> Outburst{
        let newItem = Outburst()
        items.append(newItem)
        //persistance
       
        
        
        return newItem
    }
    
    func readAllItems() -> [Outburst]{
        //read from persistance file
        return items
    }
    
    func readItem(id: UUID) -> Outburst?{
        return readAllItems().first(where: { $0.id == id })
    }
    
    func update(item: Outburst){
        items = items.map { $0.id == item.id ? item : $0}
        //overwrite persistant file
    }
    
    func delete(id: UUID){
        items.removeAll(where: {$0.id == id})
    }
    
    
}
