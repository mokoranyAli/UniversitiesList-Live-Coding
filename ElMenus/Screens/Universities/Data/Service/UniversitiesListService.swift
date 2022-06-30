//
//  UniversitiesListService.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine
import Foundation

protocol UniversitiesListServiceContract {
    func loadUniversities(name: String) -> AnyPublisher<[University], Error>
}

class UniversitiesListService: UniversitiesListServiceContract {

    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
    
    func loadUniversities(name: String) -> AnyPublisher<[University], Error> {
        let parameteres = ["country": "United+States", "name": name]
        
        let url = URL(string: Constants.url)
        var components = URLComponents(string: url?.absoluteString ?? "")
        components?.queryItems = parameteres.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let finalURL = components?.url else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return apiService.request(.init(url: finalURL))
    }
}

private extension UniversitiesListService {
    enum Constants {
        static let url = "http://universities.hipolabs.com/search"
    }
}
