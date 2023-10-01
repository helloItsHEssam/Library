//
//  PersonMapper.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct PersonMapper: Mapper {

    typealias Dto = PersonDto
    typealias Entity = Person
    
    private var imageMapper: ImageMapper
    
    init(imageMapper: ImageMapper) {
        self.imageMapper = imageMapper
    }

    func mapDtoToEntity(input: PersonDto) -> Person {
        Person(id: input.id,
               name: input.name,
               image: imageMapper.mapDtoToEntity(input: input.image),
               description: input.description)
    }
    
    func mapEntityToDto(input: Person) -> PersonDto {
        PersonDto(id: input.id,
                  name: input.name,
                  image: imageMapper.mapEntityToDto(input: input.image),
                  description: input.description)
    }
}
