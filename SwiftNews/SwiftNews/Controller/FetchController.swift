//
//  FetchController.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import Foundation

internal enum FetchErrors: Error {
    // Connection Errors
    case notPossibleToCreateUrl
    case canNotProccessData
    case dataIsNil
    
    var prettyDescription: String {
        var message: String = ""
        
        switch self {
        case .notPossibleToCreateUrl:
            message = "Not possible to create URL."
        case .dataIsNil:
            message = "Data received is empty/null."
        case .canNotProccessData:
            message = "Data received is not possible to process."
        }
        
        return "\n 🚨\(message) 🚨 \n"
    }
}

internal final class FetchController {
    internal func fetchNews(nextPage: String?, completion: @escaping(Result<News, FetchErrors>) -> Void) {
        guard var url = URL(string: Constants.kURL_JSON) else {
            completion(.failure(.notPossibleToCreateUrl))
            return
        }
        
        if let nextPageParam = nextPage {
            let urlString = url.absoluteString + "?after=\(nextPageParam)"
            url = URL(string: urlString)!
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.dataIsNil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let data = try decoder.decode(News.self, from: jsonData)
                
                completion(.success(data))
            } catch {
                completion(.failure(.canNotProccessData))
            }
        }
        
        dataTask.resume()
    }
}
