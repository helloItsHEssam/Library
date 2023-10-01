//
//  GridBookItem.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct GridBookItem: View {

    private var book: Book
    
    init(book: Book) {
        self.book = book
    }

    var body: some View {
        VStack(spacing: 16) {
            BookImage(imageUrl: book.image)
            VStack(spacing: 8) {
                NameOfBookText(content: book.name)
                NameOfAuthorText(author: book.author, lineLimit: 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
