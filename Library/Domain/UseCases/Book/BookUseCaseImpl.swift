//
//  BookUseCaseImpl.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

final class BookUseCaseImpl: BookUseCase {
    
    private var repository: BookRepository
    private var mapper: BookMapper!
    
    init(repository: BookRepository) {
        self.repository = repository
        
        let imageMapper = ImageMapper()
        let personMapper = PersonMapper(imageMapper: imageMapper)
        mapper = .init(imageMapper: imageMapper, personMapper: personMapper)
    }

    func allBooks() async throws -> [Book] {
        let booksDto = try await repository.allBooks()
        let books = mapper.mapDtosToEntities(input: booksDto)
        return books
    }
    
    func viewBook(bookId id: Int) async throws -> Book {
        let bookDto = try await repository.viewBook(bookId: id)
        let book = mapper.mapDtoToEntity(input: bookDto)
        return book
    }
}
