//
//  MockFailureUniversitiesListService.swift
//  ElMenusTests
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Foundation
@testable import ElMenus
import Combine

class MockFailureUniversitiesListService: UniversitiesListServiceContract {
    func loadUniversities(name: String) -> AnyPublisher<[University], Error> {
        return Fail(error: NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}

