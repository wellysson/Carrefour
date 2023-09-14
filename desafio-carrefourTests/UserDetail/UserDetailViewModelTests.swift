//
//  UserDetailViewModelTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class UserDetailViewModelTests: XCTestCase {
    var viewModel: MockUserDetailViewModel!
    
    override func setUpWithError() throws {
        viewModel = MockUserDetailViewModel(login: "testuser")
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testUpdateData() {
        let userDetail = UserDetail()
        userDetail.id = 1
        userDetail.avatarUrl = URL(string: "https://example.com/avatar")
        userDetail.htmlUrl = URL(string: "https://example.com/html")
        userDetail.reposUrl = URL(string: "https://example.com/repos")
        
        viewModel.updateData(userDetail: userDetail)
        
        XCTAssertEqual(viewModel.id, 1)
        XCTAssertEqual(viewModel.avatarUrl, URL(string: "https://example.com/avatar"))
        XCTAssertEqual(viewModel.htmlUrl, URL(string: "https://example.com/html"))
    }

    func testFetchUserDetailSuccess() {
        // Crie um mock para a função `GitHubAPI.getUserDetail` que retorna um objeto UserDetail
        let userDetail = UserDetail()
        userDetail.id = 1
        userDetail.avatarUrl = URL(string: "https://example.com/avatar")
        userDetail.htmlUrl = URL(string: "https://example.com/html")
        userDetail.reposUrl = URL(string: "https://example.com/repos")
        
        viewModel.setUser(userDetail: userDetail)
        let expectation = self.expectation(description: "fetchUserDetail")
        
        viewModel.delegate = self // Implemente o delegate para testar
        viewModel.coordinator = nil // Defina como nil para evitar erro
        
        viewModel.fetchUserDetail()
        
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.id, 1)
            XCTAssertNotNil(self.viewModel.avatarUrl)
            XCTAssertNotNil(self.viewModel.htmlUrl)
            XCTAssertNotNil(self.viewModel.reposUrl)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchUserDetailFailure() {
        let expectation = self.expectation(description: "fetchUserDetail")
        
        viewModel.delegate = self
        viewModel.coordinator = nil
        
        viewModel.fetchUserDetail()
        
        DispatchQueue.main.async {
            XCTAssertNil(self.viewModel.id)
            XCTAssertNil(self.viewModel.avatarUrl)
            XCTAssertNil(self.viewModel.htmlUrl)
            XCTAssertNil(self.viewModel.reposUrl)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

extension UserDetailViewModelTests: UserDetailViewModelDelegate {
    func reloadData() {
    }
}
