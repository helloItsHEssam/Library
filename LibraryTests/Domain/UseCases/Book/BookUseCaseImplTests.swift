//
//  BookUseCaseImplTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import XCTest
@testable import Library

final class BookUseCaseImplTests: XCTestCase {

    private var useCase: BookUseCase?
    
    override func setUp() {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let api = ApiImpl(configuration: configuration)
        let repository = BookRepositoryImpl(api: api)
        
        useCase = BookUseCaseImpl(repository: repository)
    }
    
    override func tearDown() {
        useCase = nil
    }

    func testAllBooks() async {
        
        do {
            let books = try await useCase?.allBooks()
            XCTAssertEqual(books?.count, 2)
            XCTAssertEqual(books?.first?.id, 1)
            
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testViewBook() async {
        
        do {
            let book = try await useCase?.viewBook(bookId: 3)
            XCTAssertEqual(book?.name, "The Hobbit (The Lord of the Rings)")
            XCTAssertEqual(book?.id, 1)
            
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testViewWrongBook() async {
        
        do {
            let book = try await useCase?.viewBook(bookId: 15)
            XCTAssertNil(book)
            
        } catch {
            let customError = error as? GeneralError
            XCTAssertNotNil(customError)
            XCTAssertEqual(customError, .cannotParseJson)
        }
    }
    
    func testViewNotFoundBook() async {
        
        do {
            let book = try await useCase?.viewBook(bookId: 12)
            XCTAssertNil(book)
            
        } catch {
            let customError = error as? GeneralError
            XCTAssertNotNil(customError)
            XCTAssertEqual(customError, .cannotConnectToServer)
        }
    }
}
