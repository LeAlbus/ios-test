//
//  JokeListTableViewController.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeListTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var presenter: JokeListPresenterProtocol?
    let loadingIcon = UIActivityIndicatorView(style: .large)
    var jokeList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Joke List"
        JokeListRouter.setupModuleReferences(from: self)
        
        self.presenter?.fetchJokeCategories()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadingData()
    }
    
    func loadingData() {

        self.loadingIcon.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIcon.startAnimating()
        self.loadingIcon.hidesWhenStopped = true
        self.view.addSubview(loadingIcon)
        self.loadingIcon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loadingIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

extension JokeListTableViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = self.jokeList[indexPath.row]
        return cell
    }
    
    
}

extension JokeListTableViewController: JokeListViewProtocol {
    
    func showCategories(_ categories: [String]) {
        self.jokeList = categories
        self.tableView.reloadData()
        self.loadingIcon.stopAnimating()
    }
    
    func showError(error: String) {
        print ("Error on joke category list: \(error)")
        self.loadingIcon.stopAnimating()
    }
    
    
}