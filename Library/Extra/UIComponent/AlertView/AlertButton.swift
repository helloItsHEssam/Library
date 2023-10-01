//
//  AlertButton.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct AlertButton: View {
    
    typealias Action = () -> Void
    
    private let action: Action
    private let title: String
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(Raleway.weight(.extraBold), size: 22))
                .padding(EdgeInsets(top: 12, leading: 32,
                                    bottom: 12, trailing: 32))
        }
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}
