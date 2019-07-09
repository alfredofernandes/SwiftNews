//
//  News.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import Foundation

public struct News: Decodable {
    private(set) var kind: String
    private(set) var data: DataResponse
    
    struct DataResponse: Decodable {
        private(set) var children: [ArticleData]
        private(set) var after: String
    }
}

public struct ArticleData: Decodable {
    private(set) var data: Article
}

public struct Article: Decodable {
    private(set) var title: String
    private(set) var description: String
    private(set) var thumbnail: String
    private(set) var thumbnailHeight: Int?
    private(set) var preview: Preview?
    
    struct Preview: Decodable {
        private(set) var images: [Images]
        private(set) var enabled: Bool
    }
    
    struct Images: Decodable {
        private(set) var source: Source
    }
    
    struct Source: Decodable {
        private(set) var url: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description = "selftext"
        case thumbnail
        case thumbnailHeight = "thumbnail_height"
        case preview
    }
}
