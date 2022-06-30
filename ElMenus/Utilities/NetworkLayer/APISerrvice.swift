//
//  APISerrvice.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Combine
import Foundation

protocol APIServiceContract {
    func request<T: Decodable>(_ urlReauest: URLRequest) -> AnyPublisher<T, Error>
}

class APIService: APIServiceContract {
    
    static let shared: APIService = .init()
    
    func request<T>(_ urlReauest: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: urlReauest)
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return NetworkError.decoding(error)
            }
            .eraseToAnyPublisher()
    }
}


