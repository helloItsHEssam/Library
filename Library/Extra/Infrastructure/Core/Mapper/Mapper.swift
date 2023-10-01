//
//  Mapper.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

protocol Mapper {

    associatedtype Entity
    associatedtype Dto

    func mapEntityToDto(input: Entity) -> Dto
    func mapDtoToEntity(input: Dto) -> Entity
}

extension Mapper {

    func mapEntitiesToDtos(input: [Entity]) -> [Dto] {
        return input.map { mapEntityToDto(input: $0) }
    }

    func mapDtosToEntities(input: [Dto]) -> [Entity] {
        return input.map { mapDtoToEntity(input: $0) }
    }
}
