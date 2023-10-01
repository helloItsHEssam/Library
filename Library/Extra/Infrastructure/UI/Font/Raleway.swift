//
//  Raleway.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

struct Raleway {
    
    enum Weight: CustomStringConvertible {
        case regular
        case semiBold
        case extraBold

        var description: String {
            var weight: String
            switch self {
            case .regular: weight = "Regular"
            case .semiBold: weight = "SemiBold"
            case .extraBold: weight = "ExtraBold"
            }
            
            return "Raleway-" + weight
        }
    }
    
    static func weight(_ weight: Weight) -> String {
        return weight.description
    }
}
