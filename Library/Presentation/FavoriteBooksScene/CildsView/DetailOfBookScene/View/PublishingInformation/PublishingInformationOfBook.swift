//
//  PublishingInformationOfBook.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct PublishingInformationOfBook: View {
    
    private var book: Book?
    
    init(book: Book? = nil) {
        self.book = book
    }
    
    var body: some View {
        HStack(spacing: 32) {
            PublishingItem(title: "ISBN-10", value: book?.isbn ?? "12335435")
            PublishingItem(title: "Price", value: "\(book?.price ?? 12)$")
            PublishingItem(title: "Language", value: book?.language ?? "English")
        }
    }
}
