//
//  UserViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

class UserViewModel {
    var login: String?
    var id: Int?
    var avatarUrl: URL?
    
    init(user: User) {
        self.login = user.login
        self.id = user.id
        self.avatarUrl = user.avatarUrl
    }
}
