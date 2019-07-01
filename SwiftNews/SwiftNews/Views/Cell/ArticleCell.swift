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
    
    public func fillCell(article: Article) {
        self.titleLabel.text = article.title
        
        guard let imageURL = URL(string: article.thumbnail) else {
            return
        }
        
        if let image = Utilities.getImage(fromURL: imageURL) {
            self.thumbnailImage.image = image
            self.thumbnailImage.isHidden = false
        } else {
            self.thumbnailImage.isHidden = true
        }
    }
}
