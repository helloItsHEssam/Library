//
//  AboutBookText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct AboutBookText: View {

    private var content: String

    init(content: String) {
        self.content = content
    }
    
    var body: some View {
        Text(content)
            .font(.custom(Raleway.weight(.regular), size: 16))
            .lineSpacing(2)
            .foregroundColor(.primaryText)
    }
}
