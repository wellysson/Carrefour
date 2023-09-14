//
//  MocksUserDetail.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import Foundation

class MockUserDetailCoordinator: UserDetailCoordinator {
    var calledServiceError = false
    override func showServiceError() {
        calledServiceError = true
    }
}
