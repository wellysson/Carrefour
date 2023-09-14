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

class MockUserDetailViewModel: UserDetailViewModel {
    var userDetailTest: UserDetail?
    func setUser(userDetail: UserDetail) {
        userDetailTest = userDetail
    }
    
    override func fetchUserDetail() {
        guard let userDetailTest = userDetailTest else { return }
        self.updateData(userDetail: userDetailTest)
    }
}
