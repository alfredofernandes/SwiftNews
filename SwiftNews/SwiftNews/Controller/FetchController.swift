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
}
