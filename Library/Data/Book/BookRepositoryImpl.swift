//
//  BookRepositoryImpl.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

final class BookRepositoryImpl: BookRepository {

    private var api: Api
    
    init(api: Api) {
        self.api = api
    }
    
    func allBooks() async throws -> [BookDto] {
        let booksData = try await api.callApi(route: .favoriteBooks)
        let books = try? JSONDecoder().decode([BookDto].self, from: booksData)
        return books ?? []
    }
    
    func viewBook(bookId id: Int) async throws -> BookDto {
        let bookData = try await api.callApi(route: .viewBook(bookId: id))
        do {
            let book = try JSONDecoder().decode(BookDto.self, from: bookData)
            return book
        } catch {
            throw GeneralError.cannotParseJson
        }
    }
}
