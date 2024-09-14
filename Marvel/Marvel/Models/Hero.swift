//
//  Hero.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import UIKit

struct APIModel: Codable {
    let data: APIResults
}

struct APIResults: Codable {
    let results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    var imageData: Data?
    private let thumbnail: ThumbnailModel
    var imageURL: URL? {
        URL(string: self.thumbnail.path + "." + self.thumbnail.`extension`)
    }
}

struct ThumbnailModel: Codable {
    let path: String
    let `extension`: String
}
