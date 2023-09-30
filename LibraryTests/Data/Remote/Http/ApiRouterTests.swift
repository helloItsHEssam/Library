//
//  ApiRouterTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
@testable import Library

final class ApiRouterTests: XCTestCase {

    func testGetHttpMethod() {
        // given
        let route = ApiRouter.favoriteBooks
        
        // when
        let httpMethod = route.getHttpMethod()
        
        // then
        XCTAssertEqual(httpMethod, .get)
        XCTAssertNotEqual(httpMethod, .post)
    }
    
    func testGetParams() {
        // given
        let route = ApiRouter.viewBook(bookId: 12)
        
        // when
        let params = route.getParams()
        
        // then
        XCTAssertNil(params)
    }
    
    func testPath() {
        // given
        let route = ApiRouter.favoriteBooks
        let route2 = ApiRouter.viewBook(bookId: 12)
        
        // when
        let path = route.urlPath
        let path2 = route2.urlPath
        
        // then
        XCTAssertEqual(path, "/book/all")
        XCTAssertEqual(path2, "/book/12")
    }
    
    func testCreateURL() {
        // given
        let route = ApiRouter.favoriteBooks
        let route2 = ApiRouter.viewBook(bookId: 12)
        
        // when
        let url = route.createURL()
        let url2 = route2.createURL()
        
        // then
        XCTAssertEqual(url.absoluteString, "http://localhost:8080/book/all")
        XCTAssertEqual(url2.absoluteString, "http://localhost:8080/book/12")
    }
    
    func testAsURLRequest() {
        // given
        let route = ApiRouter.viewBook(bookId: 12)
        
        // when
        let urlRequest = try? route.asURLRequest()
        
        // then
        XCTAssertEqual(urlRequest?.url?.absoluteString, "http://localhost:8080/book/12")
    }
}
