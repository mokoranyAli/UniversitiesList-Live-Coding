//
//  NetworkError.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case decoding(Error)
    case invalidURL
}
