//
//  BookRepository.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

protocol BookRepository {

    func allBooks() async throws -> [BookDto]
    func viewBook(bookId id: Int) async throws -> BookDto
}
