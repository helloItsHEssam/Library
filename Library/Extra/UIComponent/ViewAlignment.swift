//
//  ViewAlignment.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct ViewAlignment: ViewModifier {

    private var alignment: Alignment = .topLeading
    private var padding = EdgeInsets(top: 32, leading: 20,
                                     bottom: 20, trailing: 20)
    
    init(alignment: Alignment = .topLeading) {
        self.alignment = alignment
    }

    func body(content: Content) -> some View {
        
        ZStack(alignment: alignment) {
            Color.background
                .ignoresSafeArea()
            
            content
                .padding(padding)
        }
    }
}
