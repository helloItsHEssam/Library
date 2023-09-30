//
//  Image.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct Image: Identifiable, Equatable {
    
    var id: Int
    var url: String
    
    static func == (lhs: Image, rhs: Image) -> Bool {
        return lhs.id == rhs.id
    }
}
