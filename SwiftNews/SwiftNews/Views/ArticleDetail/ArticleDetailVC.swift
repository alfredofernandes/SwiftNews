//
//  ArticleDetailVC.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import UIKit

class ArticleDetailVC: UIViewController {
    @IBOutlet weak private var topImage: UIImageView!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    public var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.article.title
        
        self.descriptionTextView.text = self.article.selftext
        
        guard let imageURL = URL(string: self.article.thumbnail) else {
            return
        }
        
        if let image = Utilities.getImage(fromURL: imageURL) {
            self.topImage.image = image
            self.topImage.isHidden = false
        } else {
            self.topImage.isHidden = true
        }
    }
}
