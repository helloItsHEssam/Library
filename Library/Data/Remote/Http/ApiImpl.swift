//
//  ApiImpl.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation
import Alamofire

final class ApiImpl: Api {
    
    static var `default` = ApiImpl()
    
    func callApi(route: ApiRouter) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(route)
                .validate(statusCode: 200 ..< 300)
                .responseData { response in
                    continuation.resume(with: response.result)
                }
        }
    }
}
