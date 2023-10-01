//
//  BookRepositoryImplTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import XCTest
@testable import Library

final class BookRepositoryImplTests: XCTestCase {
    
    var repository: BookRepository?
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let api = ApiImpl(configuration: configuration)
        
        repository = BookRepositoryImpl(api: api)
    }
    
    override func tearDown() {
        repository = nil
    }
    
    func testAllBooks() async {
        
        do {
            let books = try await repository?.allBooks()
            XCTAssertEqual(books?.count, 2)
            
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testViewBook() async {
        
        do {
            let book = try await repository?.viewBook(bookId: 3)
            XCTAssertEqual(book?.name, "The Hobbit (The Lord of the Rings)")
            XCTAssertEqual(book?.id, 1)
            
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testViewWrongBook() async {
        
        do {
            let book = try await repository?.viewBook(bookId: 15)
            XCTAssertNil(book)
            
        } catch {
            let customError = error as? GeneralError
            XCTAssertNotNil(customError)
            XCTAssertEqual(customError, .cannotParseJson)
        }
    }
}
