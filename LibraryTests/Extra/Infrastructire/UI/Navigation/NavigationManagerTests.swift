//
//  NavigationManagerTests.swift
//  LibraryTests
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import XCTest
@testable import Library

final class NavigationManagerTests: XCTestCase {
    
    // given
    var navigationManager: NavigationManager?
    
    override func setUp() {
        navigationManager = .init()
    }
    
    override func tearDown() {
        navigationManager = nil
    }
    
    func testIsEmptynavigationManager() {
        
        // then
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }

    func testGoToDetailOfBookPage() {
        
        // when
        navigationManager?.goToDetailOfBookPage(bookdId: 1)
        
        // then
        XCTAssertFalse(navigationManager?.isEmpty ?? true)
    }
    
    func testBack() {
        
        // when
        navigationManager?.goToDetailOfBookPage(bookdId: 1)
        navigationManager?.back()
        
        // then
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }
    
    func testDoubleGoToGamePage() {
        
        // when
        navigationManager?.goToDetailOfBookPage(bookdId: 1)
        navigationManager?.goToDetailOfBookPage(bookdId: 2)
        
        // then
        XCTAssertEqual(navigationManager?.countOfPages, 2)
    }
    
    func testPopToRoot() {
        
        // when
        navigationManager?.goToDetailOfBookPage(bookdId: 1)
        navigationManager?.goToDetailOfBookPage(bookdId: 2)
        navigationManager?.popToRoot()
        
        // then
        XCTAssertEqual(navigationManager?.countOfPages, 0)
        XCTAssertTrue(navigationManager?.isEmpty ?? false)
    }
}
