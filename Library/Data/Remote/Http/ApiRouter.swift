//
//  ApiRouter.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    typealias Params = [String: Any]
    
    case favoriteBooks
    case viewBook(bookId: Int)
    
    func asURLRequest() throws -> URLRequest {
        
        let httpMethod = getHttpMethod()
        let url = createURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.timeoutInterval = 20.0
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        
        let encoding: ParameterEncoding = {
            switch httpMethod {
            default:
                return URLEncoding.queryString
            }
        }()
        
        return try encoding.encode(urlRequest, with: self.getParams())
    }
}

extension ApiRouter {
    
    func getHttpMethod() -> HTTPMethod {
        switch self {
        case .favoriteBooks, .viewBook:
            return .get
        }
    }
    
    func getParams() -> Params? {
        return nil
    }
    
    var urlPath: String {
        switch self {
        case .viewBook(let bookId):
            return "/book/\(bookId)"
            
        case .favoriteBooks:
            return "/book/all"
        }
    }
    
    func createURL() -> URL {
        var component = URLComponents()
        component.scheme = "http"
        component.host = "localhost"
        component.port = 8080
        component.path = urlPath
        return component.url!
    }
}
