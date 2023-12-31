//
//  ValuePublishingItemText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct ValuePublishingItemText: View {

    private var content: String

    init(content: String) {
        self.content = content
    }
    
    var body: some View {
        Text(content)
            .font(.custom(Raleway.weight(.semiBold), size: 14))
            .foregroundColor(.secondrayText)
    }
}
