//
//  MainViewController.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.kSWIFT_NEWS_TITLE
    }
}
