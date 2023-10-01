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
                        BackButton {
                            navigationManager.back()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        BasicInformationOfBook(screenWidth: geo.size.width,
                                               book: viewModel.book)
                        .offset(x: 0, y: -42)
                        
                        PublishingInformationOfBook(book: viewModel.book)
                        AboutItem(book: viewModel.book)
                            .padding([.top], 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .modifier(ViewAlignment(alignment: .center))
                .onAppear {
                    viewModel.fetchBook(bookId: bookId)
                }
                
                Alert(content: $viewModel.errorOfDetail) {
                    viewModel.fetchBook(bookId: bookId)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
