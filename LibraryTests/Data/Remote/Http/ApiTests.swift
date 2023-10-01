//
//  ApiTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import XCTest
import Alamofire
@testable import Library

final class ApiTests: XCTestCase {
 
    private var api: Api!
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        api = ApiImpl(configuration: configuration)
    }
    
    override func tearDown() {
        api = nil
    }
    
    func testApiAllBook() async {
        do {
            let response = try await api.callApi(route: .favoriteBooks)
            let books = try JSONDecoder().decode([BookDto].self,
                                                              from: response)
            XCTAssertEqual(books.count, 2)
            XCTAssertEqual(books.first?.author.id, 101)

        } catch {
            XCTAssertNil(error as? AFError)
        }
    }
    
    func testViewBook() async {
        do {
            let response = try await api.callApi(route: .viewBook(bookId: 3))
            let book = try JSONDecoder().decode(BookDto.self,
                                                              from: response)
            XCTAssertEqual(book.id, 1)
            XCTAssertEqual(book.price, 5.99)

        } catch {
            XCTAssertNil(error as? AFError)
        }
    }
    
    func testViewNotExistBook() async {
        do {
            _ = try await api.callApi(route: .viewBook(bookId: 12))

        } catch {
            XCTAssertNotNil(error as? GeneralError)
        }
    }
}
