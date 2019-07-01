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
    }
}

public struct ArticleData: Decodable {
    private(set) var data: Article
}

public struct Article: Decodable {
    private(set) var title: String
    private(set) var selftext: String
    private(set) var thumbnail: String
    private(set) var thumbnail_height: Int?
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
}
