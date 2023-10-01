//
//  BasicInformationOfBook.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct BasicInformationOfBook: View {

    private var book: Book?
    private var width: CGFloat = 106 // basic width
    private var height: CGFloat = 159
    
    init(screenWidth: CGFloat, book: Book? = nil) {
        self.width = screenWidth * 0.30
        self.height = self.width * 1.5
        self.book = book
    }

    var body: some View {
            VStack(spacing: 20) {
                BookImage(imageUrl: book?.image)
                    .frame(width: width, height: height)
                VStack(spacing: 12) {
                    TitleText(content: book?.name ?? "-")
                    NameOfAuthorText(author: book?.author,
                                     fontSize: 18, lineLimit: nil)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
