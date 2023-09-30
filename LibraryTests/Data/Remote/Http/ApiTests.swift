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
 
    func testApiAllBook() async {
        do {
            let response = try await ApiImpl.default.callApi(route: .favoriteBooks)
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
            let response = try await ApiImpl.default.callApi(route: .viewBook(bookId: 3))
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
            _ = try await ApiImpl.default.callApi(route: .viewBook(bookId: 12))

        } catch {
            XCTAssertNotNil(error as? AFError)
        }
    }
}
