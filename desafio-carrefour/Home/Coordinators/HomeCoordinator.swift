//
//  HomeCoordinator.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import UIKit

class HomeCoordinator {
    private let window: UIWindow
    private var navigationController: UINavigationController?
    var userDetailCoordinator: UserDetailCoordinator?

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel()
        homeViewController.viewModel?.coordinator = self

        navigationController = UINavigationController(rootViewController: homeViewController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func navigateToUser(user: UserViewModel) {
        guard let login = user.login else { return }
        self.userDetailCoordinator = UserDetailCoordinator(navigationController: self.navigationController, login: login)
        self.userDetailCoordinator?.start()
    }
}
