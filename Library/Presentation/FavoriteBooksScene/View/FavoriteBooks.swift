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
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        TitleText(content: "Favorite Books")
                        GridBook(books: viewModel.books) { bookTapped in
                            // TODO: go to detail page
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
