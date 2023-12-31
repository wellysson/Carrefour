//
//  RepositoriesCoordinator.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import UIKit
import SafariServices

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
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let safariViewController = SFSafariViewController(url: url)
            windowScene.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
        }
    }
    
    func showServiceError() {
        let alert = UIAlertController(title: "Ops!", message: "Não foi possível recuperar os repositórios, tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            self?.navigationController?.popViewController(animated: true)
        }))
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
