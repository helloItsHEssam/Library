//
//  FavoriteBooks.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct FavoriteBooks: View {
    
    @StateObject var navigationManager = NavigationManager()
    @StateObject private var viewModel = BookViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 32) {
                        TitleText(content: "Favorite Books")
                        GridBook(books: viewModel.books) { bookTapped in
                            navigationManager.goToDetailOfBookPage(bookdId: bookTapped.id)
                        }
                        .navigationDestination(for: NavigationRouter.self) { route in
                            switch route {
                            case .detailOfBookScene(let bookId):
                                DetailOfBook(viewModel: viewModel, bookId: bookId)
                            }
                        }
                    }
                }
                .modifier(ViewAlignment())
                .onAppear {
                    viewModel.fetchFavoriteBooks()
                }
                
                Alert(content: $viewModel.error) {
                    viewModel.fetchFavoriteBooks()
                }
            }
        }
        .environmentObject(navigationManager)
    }
}
