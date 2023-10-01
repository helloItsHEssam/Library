//
//  TitleText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct TitleText: View {

    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        Text(content)
            .font(.custom(Raleway.weight(.semiBold), size: 22))
            .lineSpacing(1.5)
            .foregroundColor(.primaryText)
    }
}
