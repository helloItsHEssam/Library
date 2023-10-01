//
//  BookMapperTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class BookMapperTests: XCTestCase {

    var mapper: BookMapper?
    
    override func setUp() {
        let imageMapper = ImageMapper()
        mapper = .init(imageMapper: imageMapper,
                       personMapper: PersonMapper(imageMapper: imageMapper))
    }
    
    override func tearDown() {
        mapper = nil
    }
    
    func testMapToDto() {
        
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
        
        // when
        let bookDto = mapper?.mapEntityToDto(input: book)
        
        // then
        XCTAssertEqual(bookDto?.id, book.id)
        XCTAssertEqual(bookDto?.image?.id, book.image?.id)
        XCTAssertEqual(bookDto?.author.name, book.author.name)
        XCTAssertEqual(bookDto?.price, book.price)
    }
    
    func testArrayMapToDto() {
        
        // given
        let image = Image(id: 1, url: "1.jpg")
        let person = Person(id: 11, name: "alexander",
                            image: image, description: "lorem ipsum")
        let book1 = Book(id: 111,
                        isbn: "1234",
                        name: "hobbit",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: image, author: person)
        let book2 = Book(id: 112,
                        isbn: "1234",
                        name: "hobbit2",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: image, author: person)
        
        // when
        let bookDtos = mapper?.mapEntitiesToDtos(input: [book1, book2])
        
        // then
        XCTAssertEqual(bookDtos?.count, 2)
        XCTAssertEqual(bookDtos?.first?.name, "hobbit")
    }
    
    func testMapToEntity() {
        
        // given
        let personDto = PersonDto(id: 11, name: "alexander",
                            image: nil, description: "lorem ipsum")
        let bookDto = BookDto(id: 111,
                        isbn: "12345",
                        name: "hobbit",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: nil, author: personDto)
        
        // when
        let book = mapper?.mapDtoToEntity(input: bookDto)
        
        // then
        XCTAssertEqual(bookDto.id, book?.id)
        XCTAssertNil(bookDto.image)
        XCTAssertEqual(bookDto.author.name, book?.author.name)
        XCTAssertEqual(bookDto.price, book?.price)
    }
    
    func testArrayMapToEntity() {
        
        // given
        let personDto = PersonDto(id: 11, name: "alexander",
                            image: nil, description: "lorem ipsum")
        let bookDto1 = BookDto(id: 111,
                        isbn: "1234",
                        name: "hobbit",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: nil, author: personDto)
        let bookDto2 = BookDto(id: 111,
                        isbn: "12345",
                        name: "hobbit2",
                        description: "lorem ipsum",
                        price: 11.22,
                        language: "English",
                        image: nil, author: personDto)
        
        // when
        let books = mapper?.mapDtosToEntities(input: [bookDto1, bookDto2])
        
        // then
        XCTAssertEqual(books?.count, 2)
        XCTAssertEqual(books?.first?.name, "hobbit")
        XCTAssertEqual(books?.last?.isbn, "12345")
    }
}
