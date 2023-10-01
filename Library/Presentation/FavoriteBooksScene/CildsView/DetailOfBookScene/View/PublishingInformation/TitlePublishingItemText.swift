//
//  TitlePublishingItemText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct TitlePublishingItemText: View {

    private var content: String

    init(content: String) {
        self.content = content
    }
    
    var body: some View {
        Text(content)
            .font(.custom(Raleway.weight(.extraBold), size: 14))
            .foregroundColor(.primaryText)
    }
}
