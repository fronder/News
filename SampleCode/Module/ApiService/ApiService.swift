//
//  ApiService.swift
//  SampleCode
//
//  Created by Hasan on 10/16/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let API_BASE_URL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=869d4e276804463b8b139a47809a8e4f"

protocol ApiServiceProtocol {
    associatedtype ResponseData = (JSON?, NSError?) -> ()?
}

class ApiService: NSObject, ApiServiceProtocol {
    
    static func request(completion: @escaping ResponseData) {
        Alamofire.request(API_BASE_URL, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                completion(json, nil)
            case .failure(let error):
                print(error)
                completion(nil, error as NSError)
            }
        }
    }

}
