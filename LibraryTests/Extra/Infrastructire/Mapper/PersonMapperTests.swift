//
//  PersonMapperTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class PersonMapperTests: XCTestCase {

    var mapper: PersonMapper?
    
    override func setUp() {
        mapper = .init(imageMapper: ImageMapper())
    }
    
    override func tearDown() {
        mapper = nil
    }
    
    func testMapToDto() {
        
        // given
        let image = Image(id: 1, url: "1.jpg")
        let person = Person(id: 11, name: "alexander",
                            image: image, description: "lorem ipsum")
        
        // when
        let personDto = mapper?.mapEntityToDto(input: person)
        
        // then
        XCTAssertEqual(personDto?.id, person.id)
        XCTAssertEqual(personDto?.image?.id, person.image?.id)
    }
    
    func testMapToEntity() {
        
        // given
        let imageDto = ImageDto(id: 1, url: "1.jpg")
        let personDto = PersonDto(id: 11, name: "alexander",
                            image: imageDto, description: "lorem ipsum")
        
        // when
        let person = mapper?.mapDtoToEntity(input: personDto)
        
        // then
        XCTAssertEqual(personDto.id, person?.id)
        XCTAssertEqual(personDto.image?.id, person?.image?.id)
    }
    
}
