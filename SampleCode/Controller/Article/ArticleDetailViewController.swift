//
//  ArticleDetailViewController.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class ArticleDetailViewController: BaseViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: Variables
    
    var viewModel: ArticleViewModel!
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlString = viewModel.selectedItem?.urlStringLarge {
            imageView.sd_setImage(with: URL(string: urlString), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        descriptionLabel.text = viewModel.selectedItem?.caption
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.selectedItem = nil
    }
    
    
    // MARK: Init
    
    override class func instantiate() -> ArticleDetailViewController {
        return ArticleDetailViewController.instantiate(viewControllerIdentifier: "ArticleDetail") as! ArticleDetailViewController
    }

}
