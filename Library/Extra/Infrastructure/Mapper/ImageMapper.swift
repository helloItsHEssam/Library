//
//  ImageMapper.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

final class ImageMapper: Mapper {
    
    typealias Dto = ImageDto?
    typealias Entity = Image?
    
    func mapEntityToDto(input: Image?) -> ImageDto? {
        guard let input else { return nil }
        return ImageDto(id: input.id, url: input.url)
    }
    
    func mapDtoToEntity(input: ImageDto?) -> Image? {
        guard let input else { return nil }
        return Image(id: input.id, url: input.url)
    }
}
