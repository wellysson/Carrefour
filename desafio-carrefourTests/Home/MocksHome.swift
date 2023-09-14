//
//  MocksHome.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import Foundation
import UIKit

class MockHomeCoordinator: HomeCoordinator {
    var callNavigateToUser = false
    override func navigateToUser(user: UserViewModel) {
        self.callNavigateToUser = true
    }
    
    override func start() {
        let homeViewController = MockHomeViewController()
        homeViewController.viewModel = HomeViewModel()
        homeViewController.viewModel?.coordinator = self

        navigationController = UINavigationController(rootViewController: homeViewController)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}

class MockDelegate: HomeViewModelDelegate {
    var reloadDataCalled = false
    
    func reloadData() {
        reloadDataCalled = true
    }
}

class MockHomeViewModel: HomeViewModel {
    var fetchUsersCalled = false
    var reloadDataCalled = false
    func setUsersMock(users: [UserViewModel]) {
        self.users = users
    }
    override func fetchUsers() {
        fetchUsersCalled = true
        if !(self.users?.isEmpty ?? true) {
            self.delegate?.reloadData()
        }
    }
}

class MockHomeViewController: HomeViewController {
    var reloadDataCalled = false
    
    override func setupTableView() {
    }
    
    override func updateDataTable() {
        self.reloadDataCalled = true
    }
}

class MockHomeTableViewCell: HomeTableViewCell {
    var loginUser: String? = ""
    var urlAvatar: URL? = nil
    var backgroundColorTest = ""
    
    override func configure(with viewModel: UserViewModel) {
        loginUser = viewModel.login ?? ""
        urlAvatar = viewModel.avatarUrl
    }
    
    override func prepareForReuse() {
        loginUser = nil
        urlAvatar = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColorTest = selected ? "#EEEEEE" : "#FFFFFF"
    }
}
