//
//  ImageMapper.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

final class ImageMapper: Mapper {
    
    typealias Dto = ImageDto?
    typealias Entity = ImageURL?
    
    func mapEntityToDto(input: ImageURL?) -> ImageDto? {
        guard let input else { return nil }
        return ImageDto(id: input.id, url: input.url)
    }
    
    func mapDtoToEntity(input: ImageDto?) -> ImageURL? {
        guard let input else { return nil }
        return ImageURL(id: input.id, url: input.url)
    }
}
