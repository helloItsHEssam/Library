//
//  BookUseCase.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

protocol BookUseCase {
 
    func allBooks() async throws -> [Book]
    func viewBook(bookId id: Int) async throws -> Book
}
