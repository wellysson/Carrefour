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
    var usersOriginal: [UserViewModel]?
    var filterName: String = ""
    
    weak var coordinator: HomeCoordinator?
    weak var delegate: HomeViewModelDelegate?

    func fetchUsers() {
        ProgressHud.shared.show()
        GitHubAPI.getUsers(completion: { [weak self] users in
            ProgressHud.shared.hide()
            guard let self = self else { return }
            
            if users.count > 0 {
                self.usersOriginal = users.compactMap({ user in
                    UserViewModel(user: user)
                })
                self.filterByName(name: self.filterName)
                
                self.delegate?.reloadData()
            } else {
                self.coordinator?.showServiceError()
            }
        })
    }
    
    func navigateToUser(user: UserViewModel) {
        coordinator?.navigateToUser(user: user)
    }
    
    func filterByName(name: String) {
        self.filterName = name
        if name.isEmpty{
            self.users = self.usersOriginal
        } else {
            self.users = self.usersOriginal?.filter { $0.login?.lowercased().contains(name.lowercased()) ?? false }
        }
        self.delegate?.reloadData()
    }
}
