//
//  OutburstRepositoryTest.swift
//  GetGoodTests
//
//  Created by Hiago Chagas on 23/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import XCTest
@testable import GetGood

class OutburstRepositoryTest: XCTestCase {
    
    var sut: OutburstRepository!
    override func setUp() {
        sut = OutburstRepository()    
    }
    
    func test_RepositoryQuantityOfOurbursts_EqualTo5(){
        //given
        for i in 1...10{
            let item = sut.createNewItem()
            item.text = "\(i)"
            sut.update(item: item)
        }
        for i in 1...5{
            sut.delete(id: sut.readAllItems()[i].id)
        }
        //when
        let output = sut.readAllItems().count
        //then
        XCTAssertEqual(output, 5)
    }
    
    override func tearDown() {
        //deletes everything
        for _ in 1...sut.readAllItems().count{
            sut.delete(id: sut.readAllItems()[0].id)
        }
        sut = nil
    }
}
