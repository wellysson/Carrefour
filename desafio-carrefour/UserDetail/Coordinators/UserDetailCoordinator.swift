//
//  UserDetailCoordinator.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import UIKit

class UserDetailCoordinator {
    weak var navigationController: UINavigationController?
    var repositoriesCoordinator: RepositoriesCoordinator?
    var login: String

    init(navigationController: UINavigationController?, login: String) {
        self.navigationController = navigationController
        self.login = login
    }
    
    func start() {
        let userDetailViewModel = UserDetailViewModel(login: self.login)
        userDetailViewModel.coordinator = self
        let userDetailView = UserDetailViewController()
        userDetailView.viewModel = userDetailViewModel
        
        navigationController?.pushViewController(userDetailView, animated: true)
    }
    
    func navigateToRepositories(user: UserDetailViewModel) {
        self.repositoriesCoordinator = RepositoriesCoordinator(navigationController: self.navigationController, login: user.login)
        self.repositoriesCoordinator?.start()
    }
}
