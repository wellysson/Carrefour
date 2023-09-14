//
//  UserDetailViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

protocol UserDetailViewModelDelegate: AnyObject {
    func reloadData()
}

class UserDetailViewModel {
    var login: String
    var id: Int?
    var avatarUrl: URL?
    var htmlUrl: URL?
    var reposUrl: URL?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var bio: String?
    var twitterUsername: String?
    var publicRepos: Int?
    var followers: Int?
    var following: Int?
    var createdAt: String?
    var updatedAt: String?
    
    weak var coordinator: UserDetailCoordinator?
    weak var delegate: UserDetailViewModelDelegate?
    
    init(login: String) {
        self.login = login
    }
    
    func updateData(userDetail: UserDetail) {
        self.id = userDetail.id
        self.avatarUrl = userDetail.avatarUrl
        self.htmlUrl = userDetail.htmlUrl
        self.reposUrl = userDetail.avatarUrl
        self.name = userDetail.name
        self.company = userDetail.company
        self.blog = userDetail.blog
        self.location = userDetail.location
        self.email = userDetail.email
        self.bio = userDetail.bio
        self.twitterUsername = userDetail.twitterUsername
        self.publicRepos = userDetail.publicRepos
        self.followers = userDetail.followers
        self.following = userDetail.following
        self.createdAt = userDetail.createdAt
        self.updatedAt = userDetail.updatedAt
    }
    
    func fetchUserDetail() {
        GitHubAPI.getUserDetail(userLogin: login, completion: { [weak self] userDetail in
            guard let self = self else { return }
            
            self.updateData(userDetail: userDetail)
            self.delegate?.reloadData()
        })
    }
    
    func navigateToRepositories(user: UserDetailViewModel) {
        coordinator?.navigateToRepositories(user: user)
    }
}
