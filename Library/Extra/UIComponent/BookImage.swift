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
        Image("1")
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}
