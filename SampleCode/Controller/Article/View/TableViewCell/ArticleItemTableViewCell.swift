//
//  ArticleItemTableViewCell.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleItemTableViewCell: UITableViewCell {

    static let cellIdentifier: String = {
        return "ArticleItemTableViewCell"
    }()
    
   
    // MARK: Variables
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        articleImageView.layer.cornerRadius = 30
        articleImageView.layer.masksToBounds = true
    }
    
    
    // MARK: Public
    
    public func setModel(model: ArticleItem) {
        if let urlString = model.urlStringThumbnail {
            articleImageView.sd_setImage(with: URL(string: urlString), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        titleLabel.text = model.title
        authorLabel.text = model.byline
        dateLabel.text = model.publishedDate
    }
    
}
