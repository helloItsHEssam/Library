//
//  MockURLProtocol.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 9/30/23.
//

import Foundation

final class MockURLProtocol: URLProtocol {
    
    private static var mockResponses = createMockResponse()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let url = request.url {
            if let apiResponse = MockURLProtocol.mockResponses[url] {
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
        
        // response one
        let strUrl = "http://localhost:8080/book/12"
        let url = URL(string: strUrl)!
        let data = #"{"error":true,"reason":"Not Found"}"#.data(using: .utf8)
        let httpResponse = HTTPURLResponse(url: url, statusCode: 404,
                                           httpVersion: nil, headerFields: nil)
        let notFoundResponse = ApiMockResponse(url: url, data: data,
                                               httpResponse: httpResponse,
                                               error: URLError(URLError.Code.badURL))
        
        let strUrl2 = "http://localhost:8080/book/all"
        let url2 = URL(string: strUrl2)!
        let data2 = #"""
[
  {
    "author": {
      "id": 101,
      "name": "J.R.R. Tolkien",
      "image": {
        "id": 101,
        "url": "101.jpg"
      },
      "description": "J.R.R. Tolkien was born on 3rd January 1892. After serving in the First World War, he became best known for The Hobbit and The Lord of the Rings, selling 150 million copies in more than 40 languages worldwide. Awarded the CBE and an honorary Doctorate of Letters from Oxford University, he died in 1973 at the age of 81."
    },
    "isbn": "0618260307",
    "id": 1,
    "price": 5.99,
    "image": {
      "id": 1,
      "url": "1.jpg"
    },
    "language": "English",
    "description": "                  In a hole in the ground, there lived a hobbit. So begins one of the most beloved and delightful tales in the English language.\n                  Set in the imaginary world of Middle-earth, at once a classic myth and a modern fairy tale, J.R.R. Tolkien's The Hobbit is one of literature's most enduring and well-loved novels. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics and includes a note on the text by Douglas A. Anderson.\n                  Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon.\n                  Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as Gollum.",
    "name": "The Hobbit (The Lord of the Rings)"
  },
  {
    "author": {
      "id": 101,
      "name": "J.R.R. Tolkien",
      "image": {
        "id": 101,
        "url": "101.jpg"
      },
      "description": "J.R.R. Tolkien was born on 3rd January 1892. After serving in the First World War, he became best known for The Hobbit and The Lord of the Rings, selling 150 million copies in more than 40 languages worldwide. Awarded the CBE and an honorary Doctorate of Letters from Oxford University, he died in 1973 at the age of 81."
    },
    "isbn": "0358380235",
    "id": 2,
    "price": 11.99,
    "image": {
      "id": 2,
      "url": "2.jpg"
    },
    "language": "English",
    "description": "Begin your journey into Middle-earth.\nA New Legend Begins on Prime Video, in The Lord of the Rings: The Rings of Power.\nThe Fellowship of the Ring is the first part of J.R.R. Tolkien’s epic adventure The Lord of the Rings.\nOne Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them.\nJ.R.R. Tolkien’s classic epic fantasy trilogy The Lord of the Rings, now with a fresh new package for Book 1, The Fellowship of the Ring.\nIn ancient times, the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages, it fell into the hands of Bilbo Baggins, as told in The Hobbit.\nIn a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.",
    "name": "The Fellowship of the Ring: Being the First Part of The Lord of the Rings (The Lord of the Rings, 1)"
  }
]
"""#.data(using: .utf8)
        let httpResponse2 = HTTPURLResponse(url: url2, statusCode: 200,
                                           httpVersion: nil, headerFields: nil)
        let booksResponse = ApiMockResponse(url: url2, data: data2,
                                               httpResponse: httpResponse2,
                                               error: nil)
        
        let strUrl3 = "http://localhost:8080/book/3"
        let url3 = URL(string: strUrl3)!
        let data3 = #"""
{"author":{"id":101,"name":"J.R.R. Tolkien","image":{"id":101,"url":"101.jpg"},"description":"J.R.R. Tolkien was born on 3rd January 1892. After serving in the First World War, he became best known for The Hobbit and The Lord of the Rings, selling 150 million copies in more than 40 languages worldwide. Awarded the CBE and an honorary Doctorate of Letters from Oxford University, he died in 1973 at the age of 81."},"isbn":"0618260307","id":1,"price":5.99,"image":{"id":1,"url":"1.jpg"},"language":"English","description":"                  In a hole in the ground, there lived a hobbit. So begins one of the most beloved and delightful tales in the English language.\n                  Set in the imaginary world of Middle-earth, at once a classic myth and a modern fairy tale, J.R.R. Tolkien's The Hobbit is one of literature's most enduring and well-loved novels. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics and includes a note on the text by Douglas A. Anderson.\n                  Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon.\n                  Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as Gollum.","name":"The Hobbit (The Lord of the Rings)"}
"""#.data(using: .utf8)
        let httpResponse3 = HTTPURLResponse(url: url3, statusCode: 200,
                                           httpVersion: nil, headerFields: nil)
        let bookResponse = ApiMockResponse(url: url3, data: data3,
                                               httpResponse: httpResponse3,
                                               error: nil)

        return [url: notFoundResponse, url2: booksResponse, url3: bookResponse]
    }
}
