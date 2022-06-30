//
//  UniversitiesListViewModel.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine
import Foundation

class UniversitiesListViewModel: BaseViewModel {
    
    @Published var word: String = ""
    @Published var universities: [University] = []
    
    private let useCase: LoadUniversitiesUseCaseContract
    
    init(useCase: LoadUniversitiesUseCaseContract = LoadUniversitiesUseCase()) {
        self.useCase = useCase
        super.init()
        self.setUpOnChangeWord()
    }
    
    
    private func loadData(newWord: String) {
        state = .loading
        useCase
            .execute(word: newWord)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.state = .failure(error)
                }
            } receiveValue: { [weak self] list in
                self?.universities = list
                self?.state = .success
            }.store(in: &cancellables)
        
    }
    
    private func setUpOnChangeWord() {
        $word
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] word in
                self?.loadData(newWord: word)
            }.store(in: &cancellables)
    }
}
