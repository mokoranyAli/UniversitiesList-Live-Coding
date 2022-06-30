//
//  MockSuccessUniversitiesListService.swift
//  ElMenusTests
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Foundation
@testable import ElMenus
import Combine

class MockSuccessUniversitiesListService: UniversitiesListServiceContract {
    func loadUniversities(name: String) -> AnyPublisher<[University], Error> {
        return Just([University(domains: [], webPages: [], name: "One", country: "USA", alphaTwoCode: "")])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
