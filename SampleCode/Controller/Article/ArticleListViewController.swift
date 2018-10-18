//
//  ArticleListViewController.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class ArticleListViewController: BaseViewController {
    
    // MARK: Variables
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: String(describing: ArticleItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: ArticleItemTableViewCell.cellIdentifier)
        }
    }
    
    let viewModel = ArticleViewModel()
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.title
        viewModel.didUpdateData = update
        
        viewModel.getData(completion: nil)
    }
    
    
    // MARK: Init
    
    override class func instantiate() -> ArticleListViewController {
        return ArticleListViewController.instantiate(viewControllerIdentifier: "ArticleList") as! ArticleListViewController
    }
    
    
    // MARK: Private
    
    fileprivate func update() {
        tableView.reloadData()
    }
}


// MARK: UITableViewDataSource, UITableViewDelegate

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleItemTableViewCell.cellIdentifier, for: indexPath) as! ArticleItemTableViewCell
        cell.setModel(model: viewModel.items[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        viewModel.selectedItem = item
        
        let vc = ArticleDetailViewController.instantiate()
        vc.viewModel = viewModel
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
