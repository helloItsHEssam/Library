//
//  Person.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct Person: Identifiable, Equatable {

    var id: Int
    var name: String
    var image: Image?
    var description: String
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
}
