//
//  ArticleItem.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArticleItem: NSObject {
    
    // MARK: Variables

    var perFacet: String?
    var abstract: String?
    var column: String?
    var source: String?
    var section: String?
    var type: String?
    var adxKeywords: String?
    var views: Int = 0
    var id: UInt32 = 0
    var publishedDate: String?
    var title: String!
    var assetId: UInt32 = 0
    var byline: String?
    var urlStringThumbnail: String?
    var urlStringLarge: String?
    var contentUrlString: String?
    var caption: String?
    
    
    
    // MARK: Lifecycle

    init(json: JSON!) {
        super.init()
        
        if let value = json["per_facet"].string {self.perFacet = value}
        if let value = json["abstract"].string {self.abstract = value}
        if let value = json["column"].string {self.column = value}
        if let value = json["source"].string {self.source = value}
        if let value = json["section"].string {self.section = value}
        if let value = json["type"].string {self.type = value}
        if let value = json["adx_keywords"].string {self.adxKeywords = value}
        if let value = json["views"].int {self.views = value}
        if let value = json["id"].uInt32 {self.id = value}
        if let value = json["published_date"].string {self.publishedDate = value}
        if let value = json["title"].string {self.title = value}
        if let value = json["asset_id"].uInt32 {self.assetId = value}
        if let value = json["byline"].string {self.byline = value}
        if let value = json["url"].string {self.contentUrlString = value}
        
        if let value = json["media"].array {
            if let dictionary = value.first?.dictionary {
                if let media = dictionary["media-metadata"]?.array {
                    for value in media {
                        if let format = value["format"].string, format == "Standard Thumbnail" {
                            self.urlStringThumbnail = value["url"].string
                            continue
                        } else if let format = value["format"].string, format == "Large" {
                            self.urlStringLarge = value["url"].string
                            break
                        }
                    }
                }
                if let value = dictionary["caption"]?.string {
                    self.caption = value
                }
            }
        }
    }
}
