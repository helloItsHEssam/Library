//
//  BookMapper.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct BookMapper: Mapper {

    typealias Dto = BookDto
    typealias Entity = Book
    
    private var imageMapper: ImageMapper
    private var personMapper: PersonMapper
    
    init(imageMapper: ImageMapper, personMapper: PersonMapper) {
        self.imageMapper = imageMapper
        self.personMapper = personMapper
    }

    func mapEntityToDto(input: Book) -> BookDto {
        BookDto(id: input.id,
                isbn: input.isbn,
                name: input.name,
                description: input.description,
                price: input.price,
                language: input.language,
                image: imageMapper.mapEntityToDto(input: input.image),
                author: personMapper.mapEntityToDto(input: input.author))
    }
    
    func mapDtoToEntity(input: BookDto) -> Book {
        Book(id: input.id,
                isbn: input.isbn,
                name: input.name,
                description: input.description,
                price: input.price,
                language: input.language,
                image: imageMapper.mapDtoToEntity(input: input.image),
                author: personMapper.mapDtoToEntity(input: input.author))
    }
}
