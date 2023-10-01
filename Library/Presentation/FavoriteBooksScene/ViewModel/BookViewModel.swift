//
//  BookViewModel.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import Foundation

final class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    @Published var book: Book? = nil
    @Published var error: AlertContent = .init(show: false)
    @Published var errorOfDetail: AlertContent = .init(show: false)

    private var useCase: BookUseCase!
    
    #if DEBUG
    init(useCase: BookUseCase) {
        self.useCase = useCase
    }
    #endif

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
    
    func fetchBook(bookId id: Int) {
        Task(priority: .userInitiated) {
            do {
                let book = try await useCase.viewBook(bookId: id)
                await updateBook(book: book)
            } catch {
                await updateErrorOfDetailState(message: error.localizedDescription)
            }
        }
    }

    @MainActor private func updateBooks(books: [Book]) {
        self.books = books
    }
    
    @MainActor private func updateBook(book: Book) {
        self.book = book
    }
    
    @MainActor private func updateErrorState(message: String) {
        self.error = createAlertContent(message: message)
    }
    
    @MainActor private func updateErrorOfDetailState(message: String) {
        self.errorOfDetail = createAlertContent(message: message)
    }
    
    private func createAlertContent(message: String) -> AlertContent {
        return AlertContent(show: true, message: message)
    }
}
