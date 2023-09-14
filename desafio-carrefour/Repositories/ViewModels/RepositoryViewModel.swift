//
//  RepositoryViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

class RepositoryViewModel {
    var name: String?
    var htmlUrl: URL?
    var description: String?
    
    init(repository: Repository) {
        self.name = repository.name
        self.htmlUrl = repository.htmlUrl
        self.description = repository.description
    }
}
