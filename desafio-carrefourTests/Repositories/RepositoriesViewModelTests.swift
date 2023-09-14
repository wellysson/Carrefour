//
//  RepositoriesViewModelTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class RepositoriesViewModelTests: XCTestCase {
    var viewModel: MockRepositoriesViewModel!
    var coordinatorMock: RepositoriesCoordinatorMock!
    
    override func setUpWithError() throws {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           let rootViewController = window.rootViewController as? UINavigationController else { return }
        coordinatorMock = RepositoriesCoordinatorMock(navigationController: rootViewController, login: "johndoe")
        viewModel = MockRepositoriesViewModel(login: "johndoe")
        viewModel.coordinator = coordinatorMock
    }

    override func tearDownWithError() throws {
        viewModel = nil
        coordinatorMock = nil
    }

    func testFetchRepositorySuccess() {
        let mockRepositories = [RepositoryViewModel(repository: Repository()), RepositoryViewModel(repository: Repository())]
        viewModel.setRepos(repos: mockRepositories)
        viewModel.fetchRepository()
        
        XCTAssertNotNil(viewModel.repositories)
        XCTAssertEqual(viewModel.repositories?.count, 2)
        XCTAssertTrue(coordinatorMock.navigateToRepositoryCalled)
    }

    func testFetchRepositoryFailure() {
        viewModel.fetchRepository()
        
        XCTAssertNil(viewModel.repositories)
        XCTAssertTrue(coordinatorMock.showServiceErrorCalled)
    }
}

class RepositoriesCoordinatorMock: RepositoriesCoordinator {
    var navigateToRepositoryCalled = false
    var showServiceErrorCalled = false
    
    override func navigateToRepository(url: URL) {
        navigateToRepositoryCalled = true
    }
    
    override func showServiceError() {
        showServiceErrorCalled = true
    }
}

class MockRepositoriesViewModel: RepositoriesViewModel {
    func setRepos(repos: [RepositoryViewModel]?) {
        repositories = repos
    }
    
    override func fetchRepository() {
        if repositories != nil {
            coordinator?.navigateToRepository(url: URL(fileURLWithPath: "http://teste.teste.com"))
        } else {
            coordinator?.showServiceError()
        }
    }
}
