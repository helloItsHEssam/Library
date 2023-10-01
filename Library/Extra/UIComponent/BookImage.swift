//
//  BookImage.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct BookImage: View {
    
    private var imageUrl: ImageURL?
    
    init(imageUrl: ImageURL?) {
        self.imageUrl = imageUrl
    }

    var body: some View {
        let url = URL(string: imageUrl?.url ?? "")
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()

        } placeholder: {
            Image("placeholder")
                .resizable()
                .scaledToFit()
        }
        .cornerRadius(12)
    }
}
