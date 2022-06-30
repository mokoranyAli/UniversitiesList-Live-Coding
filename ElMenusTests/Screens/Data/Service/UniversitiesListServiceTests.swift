//
//  UniversitiesListServiceTests.swift
//  ElMenusTests
//
//  Created by Mohamed Korany on 19/06/2022.
//

import XCTest
import Combine
@testable import ElMenus

class UniversitiesListServiceTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    private var sut: UniversitiesListService!
    
    override func setUp() {
        super.setUp()
        sut = .init(apiService: MockAPIService(fileName: "Universities"))
    }
    
    override func tearDown() {
        sut = nil
        cancellables.removeAll()
        super.tearDown()
    }
    
    func testSUT_whenLoadDataSuccessfully_shouldGetTwoElements() {
        // Given
        let expectation = self.expectation(description: "Load Universities")
        var expectedItems: [University]!
        // When
        sut.loadUniversities(name: "")
            .sink { completion in
            } receiveValue: { list in
                expectedItems = list
                expectation.fulfill()
            }.store(in: &cancellables)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(expectedItems.count, 2)
    }
    
    func testSUT_whenInvalidURL_shouldGetError() {
        // Given
        let expectation = self.expectation(description: "Load Universities")
        var expectedError: Error!
        sut = .init(apiService: MockAPIService(fileName: "Wrong Name"))
        // When
        sut.loadUniversities(name: "")
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

