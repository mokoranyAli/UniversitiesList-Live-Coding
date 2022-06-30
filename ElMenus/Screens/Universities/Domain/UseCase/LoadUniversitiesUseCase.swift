//
//  LoadUniversitiesUseCase.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine
protocol LoadUniversitiesUseCaseContract {
    func execute(word: String) -> AnyPublisher<[University], Error>
}

class LoadUniversitiesUseCase: LoadUniversitiesUseCaseContract {

    private let repository: UniversitiesRepositoryContract
    
    init(repository: UniversitiesRepositoryContract = UniversitiesRepository()) {
        self.repository = repository
    }
    
    func execute(word: String) -> AnyPublisher<[University], Error> {
        repository.loadUniversities(word: word)
    }
}
