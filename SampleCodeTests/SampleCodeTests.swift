//
//  SampleCodeTests.swift
//  SampleCodeTests
//
//  Created by Hasan on 10/16/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import XCTest
@testable import SampleCode
import Alamofire
import SwiftyJSON

class SampleCodeTests: XCTestCase {
    
    var vc: ArticleListViewController!
    
    override func setUp() {
        super.setUp()
        
        vc = UIStoryboard(name: "Main", bundle: Bundle(for:ArticleListViewController.self)).instantiateViewController(withIdentifier: "ArticleList") as! ArticleListViewController
        let _ = vc.view
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }
    
    // MARK: Request test
    
    func testRequest() {
        let expectations = expectation(description: "The Response result match the expected results")
        
        vc.viewModel.getData { (json, error) -> () in
            if let _ = json {
                expectations.fulfill()
            } else {
                XCTFail("Server response failed : \(String(describing: error?.localizedDescription))")
                expectations.fulfill()
            }
        }
        
        waitForExpectations(timeout: 30, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
            
        })
    }
    
    func testTableViewOutlet() {
        XCTAssertNotNil(vc.tableView, "TableView not initiated");
    }
    
    func testTableViewCellForRowAtIndexPath() {
        let expectations = expectation(description: "There should be data to laod into cells")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectations.fulfill()
        }
         waitForExpectations(timeout: 5, handler: nil)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        let cell = vc.tableView((vc.tableView)!, cellForRowAt: IndexPath(row: 0, section: 0)) as! ArticleItemTableViewCell
        let item = vc.viewModel.items[indexPath.row]
        
        XCTAssertEqual(cell.titleLabel.text!, item.title, "")
        XCTAssertEqual(cell.authorLabel.text!, item.byline, "")
        XCTAssertEqual(cell.dateLabel.text!, item.publishedDate, "")
    }
}
