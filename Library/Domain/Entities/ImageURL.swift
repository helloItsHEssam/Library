//
//  ImageURL.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct ImageURL: Identifiable, Equatable {
    
    var id: Int
    var url: String
    
    static func == (lhs: ImageURL, rhs: ImageURL) -> Bool {
        return lhs.id == rhs.id
    }
}
