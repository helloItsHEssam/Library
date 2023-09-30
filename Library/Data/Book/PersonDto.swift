//
//  PersonDto.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct PersonDto: Decodable {

    var id: Int
    var name: String
    var image: ImageDto?
    var description: String
}
