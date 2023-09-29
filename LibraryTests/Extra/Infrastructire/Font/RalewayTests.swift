//
//  RalewayTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class RalewayTests: XCTestCase {
    
    func testWeight() {
        
        // when
        let boldFont = Raleway.weight(.semiBold)
        
        // then
        XCTAssertEqual(boldFont, "Raleway-SemiBold")
        XCTAssertNotEqual(boldFont, "Raleway-Regular")
        XCTAssertNotEqual(boldFont, "Raleway-ExtraBold")
    }

}
