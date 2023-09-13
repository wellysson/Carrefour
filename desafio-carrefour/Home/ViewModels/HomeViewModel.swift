//
//  HomeViewModel.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation

class HomeViewModel {
    weak var coordinator: HomeCoordinator?

    func navigateToRegistration() {
        coordinator?.navigateToUser()
    }
}
