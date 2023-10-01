//
//  FavoriteBooks.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct FavoriteBooks: View {
    
    @StateObject var navigationManager = NavigationManager()

    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    TitleText(content: "Favorite Books")
                    GridBook()
                }
            }
            .modifier(ViewAlignment())
        }
        .environmentObject(navigationManager)
    }
}
