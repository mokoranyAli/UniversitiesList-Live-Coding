//
//  University.swift
//  ElMenus
//
//  Created by Mohamed Korany on 19/06/2022.
//

import Foundation

struct University: Decodable, Hashable {
    let domains: [String]?
    let webPages: [String]?
    let name, country, alphaTwoCode: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case webPages = "web_pages"
        case name, country
        case alphaTwoCode = "alpha_two_code"
    }
}
