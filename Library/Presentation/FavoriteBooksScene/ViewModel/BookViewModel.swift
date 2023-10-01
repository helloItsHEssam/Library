//
//  BookViewModel.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import Foundation

final class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    @Published var error: AlertContent = .init(show: false)

    private var useCase: BookUseCase!
    
    init() {
        let api = ApiImpl()
        let repository = BookRepositoryImpl(api: api)
        useCase = BookUseCaseImpl(repository: repository)
    }
    
    func fetchFavoriteBooks() {
        Task(priority: .userInitiated) {
            do {
                let books = try await useCase.allBooks()
                await updateBooks(books: books)
            } catch {
                await updateErrorState(message: error.localizedDescription)
            }
        }
    }

    @MainActor private func updateBooks(books: [Book]) {
        self.books = books
    }
    
    @MainActor private func updateErrorState(message: String) {
        self.error.message = message
        self.error.show.toggle()
    }
}
