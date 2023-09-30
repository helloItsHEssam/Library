//
//  BookTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class BookTests: XCTestCase {
    
    func testEquatable() {
        
        // given
        let image = Image(id: 1, url: "1.jpg")
        let person = Person(id: 11, name: "alexander",
                            image: image, description: "lorem ipsum")
        let book = Book(id: 111,
                        isbn: "1234",
                        name: "hobbit",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: image, author: person)
        let book1 = Book(id: 111,
                        isbn: "1234",
                        name: "hobbit",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: image, author: person)
        
        // then
        XCTAssertEqual(book1, book)
    }
}
