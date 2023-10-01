//
//  GeneralError.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import Foundation

enum GeneralError: Error, LocalizedError {
    
    case cannotConnectToServer
    case cannotParseJson
    
    var errorDescription: String? {
        switch self {
        case .cannotConnectToServer: return "You seem to be offline!"
        case .cannotParseJson: return "Unexpected error"
        }
    }
}
