//
//  ArticleCell.swift
//  SwiftNews
//
//  Created by Alfredo Fernandes on 2019-07-01.
//  Copyright © 2019 Alfredo Fernandes. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var thumbnailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func fillCell(article: News) {
        self.titleLabel.text = article.title
    }
}
