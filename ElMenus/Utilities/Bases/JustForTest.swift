//
//  JustForTest.swift
//  ElMenus
//
//  Created by Mohamed Korany on 23/06/2022.
//

import Combine
import Foundation


class APIServiceDemo {
    
    func request<T: Decodable>(_ reqeust: URLRequest) -> AnyPublisher<T, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: reqeust)
            .tryMap {  output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.decoding(error)
            }
            .eraseToAnyPublisher()
    }
}
