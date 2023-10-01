//
//  AboutItem.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct AboutItem: View {
    
    private var book: Book?
    
    init(book: Book? = nil) {
        self.book = book
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TitleText(content: "What's it about?")
            AboutBookText(content: book?.description ?? "hello")
        }
    }
}
