//
//  MesageAlertText.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct MesageAlertText: View {
    
    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        Text(content)
            .font(.custom(Raleway.weight(.regular), size: 22))
            .foregroundColor(.black)
    }
}
