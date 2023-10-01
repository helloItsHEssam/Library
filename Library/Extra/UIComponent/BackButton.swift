//
//  BackButton.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct BackButton: View {
    typealias Action = () -> Void
    
    private let action: Action
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image("back")
        }
    }
}
