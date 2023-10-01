//
//  BookViewModelTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import XCTest
import Combine
@testable import Library

final class BookViewModelTests: XCTestCase {

    var cancellables: [AnyCancellable] = []
    
    override func tearDown() {
        cancellables.removeAll()
    }

    func testFetchFavoriteBooks() {
        
        // given
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let api = ApiImpl(configuration: configuration)
        let repository = BookRepositoryImpl(api: api)
        let useCase = BookUseCaseImpl(repository: repository)
        
        let viewModel = BookViewModel(useCase: useCase)

        let expectation = XCTestExpectation(description: "fetch books")
        
        viewModel.$books
            .dropFirst()
            .sink(receiveValue: {
                
                // then
                XCTAssertEqual($0.count, 2)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        //When
        viewModel.fetchFavoriteBooks()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testOfflineFetchFavoriteBooks() {
        
        // given
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [OfflineServerMockURLProtocol.self]
        let api = ApiImpl(configuration: configuration)
        let repository = BookRepositoryImpl(api: api)
        let useCase = BookUseCaseImpl(repository: repository)
        
        let viewModel = BookViewModel(useCase: useCase)

        let expectation = XCTestExpectation(description: "fetch books")
        
        viewModel.$error
            .dropFirst()
            .sink(receiveValue: {
                
                // then
                XCTAssertEqual($0.show, true)
                XCTAssertEqual($0.message, "You seem to be offline!")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        //When
        viewModel.fetchFavoriteBooks()
        wait(for: [expectation], timeout: 5.0)
    }
}
