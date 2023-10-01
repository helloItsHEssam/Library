//
//  ApiMockResponseTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class ApiMockResponseTests: XCTestCase {

    func testEqutable() {
        
        // given
        let url1 = URL(string: "http://localhost/book/all")!
        let apiMock1 = ApiMockResponse(url: url1,
                                       data: Data(), httpResponse: nil, error: nil)
        
        let url2 = URL(string: "http://localhost/book/12")!
        let apiMock2 = ApiMockResponse(url: url2, data: nil,
                                       httpResponse: nil, error: nil)
        
        // when
        let isNotSame = apiMock1 == apiMock2
        
        // then
        XCTAssertFalse(isNotSame)
    }
}
