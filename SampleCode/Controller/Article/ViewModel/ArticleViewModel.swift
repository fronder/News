//
//  ArticleViewModel.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class ArticleViewModel: NSObject, ApiServiceProtocol {
    
    // MARK: Variables

    var title: String = {
        return "NY Times articles"
    }()
    
    var items: [ArticleItem] = []
    var selectedItem: ArticleItem?
    
    var didUpdateData: () -> () = {}

    
    // MARK: Lifecycle
    
    override init() {
        super.init()
    }
    
    
    // MARK: Internal
    
    func getData(completion: ResponseData?) {
        ApiService.request { (json, error) -> () in
            if let json = json {
                for item in (json["results"].array)! {
                    self.items.append(ArticleItem(json: item))
                }
                
                onMain { [weak self] in
                    self?.didUpdateData()
                }
            }
            if let completion = completion {
              completion(json, error)
            }
        }
    }
    
    func count() -> Int {
        return items.count
    }
}
