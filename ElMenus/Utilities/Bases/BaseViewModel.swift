//
//  BaseViewModel.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine

class BaseViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var state: ViewModelState = .idle
}
