//
//  BookDto.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct BookDto: Decodable {
    
    var id: Int
    var isbn: String
    var name: String
    var description: String
    var price: Double
    var language: String
    var image: ImageDto?
    var author: PersonDto
}
