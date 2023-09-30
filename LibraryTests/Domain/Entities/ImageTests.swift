//
//  ImageTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class ImageTests: XCTestCase {
    
    func testEquatable() {
        
        // given
        let image = Image(id: 1, url: "1.jpg")
        let image1 = Image(id: 1, url: "1.jpg")
        
        // then
        XCTAssertEqual(image1, image)
    }
}
