//
//  DetailOfBook.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct DetailOfBook: View {
    
    @EnvironmentObject private var navigationManager: NavigationManager
    @ObservedObject private var viewModel: BookViewModel
    private var bookId: Int

    init(viewModel: BookViewModel, bookId: Int) {
        self.viewModel = viewModel
        self.bookId = bookId
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 32) {
                        BasicInformationOfBook(screenWidth: geo.size.width,
                                               book: nil)
                        PublishingInformationOfBook(book: nil)
                        AboutItem(book: nil)
                            .padding([.top], 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .modifier(ViewAlignment(alignment: .center))
                .onAppear {
    //                viewModel.fetchFavoriteBooks()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
