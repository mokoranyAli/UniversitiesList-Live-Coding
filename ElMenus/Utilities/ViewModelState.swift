//
//  ViewModelState.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Foundation

enum ViewModelState {
    case idle
    case loading
    case success
    case failure(Error)
}

extension ViewModelState: Equatable {
    static func == (lhs: ViewModelState, rhs: ViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading),
            (.success, .success),
            (.idle, .idle):
            return true
            
        default: return false
        }
    }
    
    
}
