//
//  RepositoriesCoordinator.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import UIKit

class RepositoriesCoordinator {
    weak var navigationController: UINavigationController?
    var login: String

    init(navigationController: UINavigationController?, login: String) {
        self.navigationController = navigationController
        self.login = login
    }
    
    func start() {
        let repositoriesViewModel = RepositoriesViewModel(login: self.login)
        repositoriesViewModel.coordinator = self
        let repositoriesView = RepositoriesViewController()
        repositoriesView.viewModel = repositoriesViewModel
        
        navigationController?.pushViewController(repositoriesView, animated: true)
    }
    
    func navigateToRepository(url: URL) {
        //abrir browser
    }
}
