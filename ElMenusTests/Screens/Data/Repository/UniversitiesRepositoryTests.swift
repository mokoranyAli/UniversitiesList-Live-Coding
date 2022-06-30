//
//  UniversitiesRepositoryTests.swift
//  ElMenusTests
//
//  Created by Mohamed Korany on 19/06/2022.
//

import XCTest
@testable import ElMenus
import Combine

class UniversitiesRepositoryTests: XCTestCase {

    private var sut: UniversitiesRepository!
    private var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        sut = .init(service: MockSuccessUniversitiesListService())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetUSAContry() {
        // Given
        let expectation = self.expectation(description: "Load Universities")
        let expectedCountry = "USA"
        var realCountry: String!
        // When
        sut.loadUniversities(word: "")
            .sink { completion in
            } receiveValue: { list in
                realCountry = list.first?.country ?? ""
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(realCountry, expectedCountry)
    }
    
    func testSUT_whenInvalidURL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Universities")
        var expectedError: Error!
        sut = .init(service: MockFailureUniversitiesListService())
        // When
        sut.loadUniversities(word: "")
            .sink { completion in
                
                if case .failure(let error) = completion {
                    expectedError = error
                    expectation.fulfill()
                }
            } receiveValue: { _ in
 
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedError)
    }
}
