//
//  HomeViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
}

class HomeViewModel {
    var users: [UserViewModel]?
    
    weak var coordinator: HomeCoordinator?
    weak var delegate: HomeViewModelDelegate?

    func fetchUsers() {
        GitHubAPI.getUsers(completion: { [weak self] users in
            guard let self = self else { return }
            
            self.users = users.compactMap({ user in
                UserViewModel(user: user)
            })
            
            self.delegate?.reloadData()
        })
    }
    
    func navigateToUser(user: UserViewModel) {
        coordinator?.navigateToUser(user: user)
    }
}
