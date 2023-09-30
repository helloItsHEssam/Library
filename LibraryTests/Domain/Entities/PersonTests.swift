//
//  PersonTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class PersonTests: XCTestCase {

    func testEquatable() {
        
        // given
        let image = Image(id: 1, url: "1.jpg")
        let person = Person(id: 11, name: "alexander",
                            image: image, description: "lorem ipsum")
        let person1 = Person(id: 11, name: "alexander",
                            image: image, description: "lorem ipsum")
        
        // then
        XCTAssertEqual(person1, person)
    }
}
