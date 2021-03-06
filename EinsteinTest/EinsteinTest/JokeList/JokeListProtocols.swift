//
//  JokeListProtocols.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

protocol JokeListViewProtocol: class {
        
    func showCategories(_ categories: [String])
    func showError(error: String)
}

protocol JokeListInteractorProtocol: class {
    
    var presenter: JokeListPresenterProtocol? {get set}
    func fetchCategories()
}

protocol JokeListPresenterProtocol: class {
    
    var view: JokeListViewProtocol? {get set}
    var interactor: JokeListInteractorProtocol? {get set}
    var router: JokeListRouter? {get set}
    
    func fetchJokeCategories()
    func goToJoke(with category: String, navController: UINavigationController)
    
    func onFetchJokeSuccess(jokeList: [String])
    func onFetchJokeError(error: String)
}

protocol JokeListRouterProtocol: class {
    
    static func setupModuleReferences(from listView: JokeListTableViewController)
    func openJoke(from navController: UINavigationController, category: String)
}
