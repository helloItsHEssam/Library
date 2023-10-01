//
//  NameOfAuthorText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct NameOfAuthorText: View {

    private var author: Person
    private var fontSize: CGFloat
    private var lineLimit: Int?
    
    init(author: Person, fontSize: CGFloat = 12, lineLimit: Int? = nil) {
        self.author = author
        self.fontSize = fontSize
        self.lineLimit = lineLimit
    }

    var body: some View {
        Text("By \(author.name)")
            .font(.custom(Raleway.weight(.regular), size: fontSize))
            .lineLimit(lineLimit)
            .foregroundColor(.secondrayText)
    }
}
