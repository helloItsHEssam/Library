//
//  Alert.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

struct Alert: View {
    typealias TryAgainCallBackType = () -> Void
    
    @Binding private var content: AlertContent
    private var tryAgain: TryAgainCallBackType

    init(content: Binding<AlertContent>, tryAgain: @escaping TryAgainCallBackType) {
        self._content = content
        self.tryAgain = tryAgain
    }
    
    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.2)) {
            content.show.toggle()
        }
    }
    
    private func tryAgainTapped() {
        withAnimation(.easeInOut(duration: 0.2)) {
            content.show.toggle()
            tryAgain()
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if content.show {
                    Color.black.opacity(content.show ? 0.7 : 0.0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            dismiss()
                        }
                    VStack(spacing: 32) {
                        MesageAlertText(content: content.message ?? "Error")
                            .padding([.leading, .trailing, .top], 20)
                        
                        AlertButton(title: "try again!") {
                            tryAgainTapped()
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: geometry.size.width - 80)
                    .background(Color.white)
                    .cornerRadius(12)
                    .transition(.scale)
                }
            }
        }
    }
}
