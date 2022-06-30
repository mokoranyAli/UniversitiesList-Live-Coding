//
//  UniversitiesRepository.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine

protocol UniversitiesRepositoryContract {
    func loadUniversities(word: String) -> AnyPublisher<[University], Error>
}

class UniversitiesRepository: UniversitiesRepositoryContract {

    private let service: UniversitiesListServiceContract
    
    init(service: UniversitiesListServiceContract = UniversitiesListService()) {
        self.service = service
    }
    
    func loadUniversities(word: String) -> AnyPublisher<[University], Error> {
        service.loadUniversities(name: word)
    }
}
