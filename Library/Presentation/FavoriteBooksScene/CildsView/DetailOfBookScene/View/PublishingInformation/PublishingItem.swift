//
//  PublishingItem.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct PublishingItem: View {
    
    private var title: String
    private var value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        VStack(spacing: 8) {
            TitlePublishingItemText(content: title)
            ValuePublishingItemText(content: value)
        }
    }
}
