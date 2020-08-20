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
        if let data = try? JSONEncoder().encode(newItem){
            FileHelper().createFile(with: data, name: newItem.id.uuidString)
        }
        return newItem
    }
    func readAllItems() -> [Outburst]{
        //read from persistance file
        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
        self.items = fileNames.compactMap {(fileName) -> Outburst? in
            if let data = FileHelper().retrieveFile(at: fileName){
                //decode from Data to Outburst type
                let item = try? JSONDecoder().decode(Outburst.self, from: data)
                return item
            }
            return nil
        }
        return items
    }
    
    func readItem(id: UUID) -> Outburst?{
        if let data = FileHelper().retrieveFile(at: id.uuidString) {
            let item = try? JSONDecoder().decode(Outburst.self, from: data)
            return item
        }
        return nil
    }
    
    func update(item: Outburst){
        if let data = try? JSONEncoder().encode(item){
            FileHelper().updateFile(at: item.id.uuidString, data: data)
        }
    }
    
    func delete(id: UUID){
        FileHelper().removeFile(at: id.uuidString)
    }
    
    
}
