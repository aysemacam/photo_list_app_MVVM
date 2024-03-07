//
//  Product.swift
//  amani_task
//
//  Created by Aysema Çam on 6.03.2024.
//

import Foundation

import Foundation

public struct Product: Codable {
    var id: Int
    var title: String
    var imgURL: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imgURL = "base64"
        case description = "description"
    }
}

struct ProductResponse: Codable {
    let images: [Product]
}

