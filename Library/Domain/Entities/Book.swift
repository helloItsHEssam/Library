//
//  Book.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct Book: Identifiable, Equatable {
    
    var id: Int
    var isbn: String
    var name: String
    var description: String
    var price: Double
    var language: String
    var image: Image?
    var author: Person
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id
    }
}
