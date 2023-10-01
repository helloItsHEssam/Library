//
//  ImageMapperTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class ImageMapperTests: XCTestCase {

    var mapper: ImageMapper?
    
    override func setUp() {
        mapper = .init()
    }
    
    override func tearDown() {
        mapper = nil
    }
    
    func testMapToDto() {
        
        // given
        let image = ImageURL(id: 1, url: "1.jpg")
        
        // when
        let imageDto = mapper?.mapEntityToDto(input: image)
        
        // then
        XCTAssertEqual(imageDto?.id, image.id)
        XCTAssertEqual(imageDto?.url, image.url)
    }
    
    func testMapToEntity() {
        
        // given
        let imageDto = ImageDto(id: 1, url: "1.jpg")
        
        // when
        let image = mapper?.mapDtoToEntity(input: imageDto)
        
        // then
        XCTAssertEqual(imageDto.id, image?.id)
        XCTAssertEqual(imageDto.url, image?.url)
    }
    
    func testMapNil() {
        
        // given
        let imageDto: ImageDto? = nil
        
        // when
        let image = mapper?.mapDtoToEntity(input: imageDto)
        
        // then
        XCTAssertNil(image)
    }
}
