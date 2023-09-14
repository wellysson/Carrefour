//
//  RepositoriesViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

protocol RepositoriesViewModelDelegate: AnyObject {
    func reloadData()
}

class RepositoriesViewModel {
    var login: String
    var repositories: [RepositoryViewModel]?
    
    weak var coordinator: RepositoriesCoordinator?
    weak var delegate: RepositoriesViewModelDelegate?
    
    init(login: String) {
        self.login = login
    }
    
    
    func fetchRepository() {
        ProgressHud.shared.show()
        GitHubAPI.getRepositories(userLogin: login, completion: { [weak self] repositories in
            ProgressHud.shared.hide()
            guard let self = self else { return }
            
            if repositories.count > 0 {
                self.repositories = repositories.compactMap({ repository in
                    RepositoryViewModel(repository: repository)
                })
                self.delegate?.reloadData()
            } else {
                self.coordinator?.showServiceError()
            }
        })
    }
    
    func navigateToRepository(url: URL) {
        coordinator?.navigateToRepository(url: url)
    }
}
