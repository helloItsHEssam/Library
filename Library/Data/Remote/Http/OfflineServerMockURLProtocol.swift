//
//  OfflineServerMockURLProtocol.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import Foundation

final class OfflineServerMockURLProtocol: URLProtocol {
    
    private static var mockResponses = createMockResponse()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let url = request.url {
            if let apiResponse = OfflineServerMockURLProtocol.mockResponses[url] {
                if let response = apiResponse.httpResponse {
                    client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                }
                if let data = apiResponse.data {
                    client?.urlProtocol(self, didLoad: data)
                }
                if let error = apiResponse.error {
                    client?.urlProtocol(self, didFailWithError: error)
                }
            }
            client?.urlProtocolDidFinishLoading(self)
        }
    }
    
    override func stopLoading() {}
    
    private static func createMockResponse() -> [URL: ApiMockResponse] {
        
        let strUrl = "http://localhost:8080/book/all"
        let url = URL(string: strUrl)!
        let data = "offline server".data(using: .utf8)
        let httpResponse = HTTPURLResponse(url: url, statusCode: 400,
                                            httpVersion: nil, headerFields: nil)
        let booksResponse = ApiMockResponse(url: url, data: data,
                                            httpResponse: httpResponse,
                                            error: URLError(URLError.Code.badURL))
        
        let strUrl2 = "http://localhost:8080/book/33"
        let url2 = URL(string: strUrl2)!
        let data2 = "offline server".data(using: .utf8)
        let httpResponse2 = HTTPURLResponse(url: url2, statusCode: 400,
                                            httpVersion: nil, headerFields: nil)
        let bookResponse = ApiMockResponse(url: url2, data: data2,
                                            httpResponse: httpResponse2,
                                            error: URLError(URLError.Code.badURL))
        
        return [url: booksResponse, url2: bookResponse]
    }
}
