//
//  Api.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

protocol Api {
    
    func callApi(route: ApiRouter) async throws -> Data
}
