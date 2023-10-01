//
//  GridBook.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct GridBook: View {
    typealias ItemTappedType = (Book) -> Void
    
    private let itemLayout = GridItem(.flexible(), spacing: 20,
                                      alignment: .center)
    
    private var books: [Book]
    private var itemTapped: ItemTappedType
    
    init(books: [Book],
         itemTapped callback: @escaping ItemTappedType) {
        self.books = books
        self.itemTapped = callback
    }
    
    var body: some View {
        let gridItemLayout = Array(repeating: itemLayout, count: 3)
        
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(books) { book in
                GridBookItem(book: book)
                    .onTapGesture {
                        itemTapped(book)
                    }
            }
        }
    }
}
