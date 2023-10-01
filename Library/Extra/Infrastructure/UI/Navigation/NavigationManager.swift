//
//  NavigationManager.swift
//  Library
//
//  Created by Hessam Mahdiabadi on 10/1/23.
//

import SwiftUI

class NavigationManager: ObservableObject {

    @Published var path = NavigationPath()

    var isEmpty: Bool {
        path.isEmpty
    }
    
    var countOfPages: Int {
        path.count
    }

    func popToRoot() {
        path = NavigationPath()
    }

    func back() {
        path.removeLast()
    }

    func goToDetailOfBookPage() {
        path.append(NavigationRouter.detailOfBookScene)
    }
}
