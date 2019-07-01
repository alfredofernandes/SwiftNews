//
//  CoreFacade.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import Foundation

class CoreFacade {
    // MARK: Private variables
    private let fetchController: FetchController
    
    // MARK: Shared Instance
    
    static let shared: CoreFacade = {
        let instance = CoreFacade()
        return instance
    }()
    
    // MARK: Initialization
    
    private init() {
        self.fetchController = FetchController()
    }
    
    // MARK: - News
    
    public func fetchNews(completion: @escaping(Result<News, FetchErrors>) -> Void) {
        self.fetchController.fetchNews(completion: completion)
    }
}
