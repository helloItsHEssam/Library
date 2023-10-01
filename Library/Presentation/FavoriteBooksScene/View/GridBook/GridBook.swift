//
//  GridBook.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct GridBook: View {

    private let gridItemLayout = Array(repeating: GridItem(.flexible(),
                                                           spacing: 20,
                                                           alignment: .center),
                                       count: 3)
    
    let books: [Book] = [] // empty data
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(books) { book in
                GridBookItem(book: book)
                    .onTapGesture {
                        
                    }
            }
        }
    }
}
