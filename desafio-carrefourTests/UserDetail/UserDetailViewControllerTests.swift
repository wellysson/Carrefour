//
//  UserDetailViewControllerTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class UserDetailViewControllerTests: XCTestCase {
    var viewController: UserDetailViewController!
    var viewModelMock: UserDetailViewModelMock!
    
    override func setUpWithError() throws {
        viewController = UserDetailViewController()
        viewModelMock = UserDetailViewModelMock(login: "jondoe")
        viewController.viewModel = viewModelMock
        viewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewController = nil
        viewModelMock = nil
    }

    func testViewDidLoadCallsFetchUserDetail() {
        viewController.viewDidLoad()
        XCTAssertTrue(viewModelMock.fetchUserDetailCalled)
    }

    func testLoadData() {
        // Configure a view model mock with test data
        viewModelMock.name = "John Doe"
        viewModelMock.login = "johndoe"
        viewModelMock.location = "New York"
        viewModelMock.company = "ABC Inc."
        viewModelMock.twitterUsername = "johndoe123"
        viewModelMock.publicRepos = 10
        viewModelMock.followers = 100
        viewModelMock.createdAt = "2023-09-12T12:00:00Z"
        viewModelMock.updatedAt = "2023-09-13T14:30:00Z"
        viewModelMock.bio = "A software developer"
        
        viewController.loadData()
        
        XCTAssertEqual(viewController.nameLabel.text, "John Doe")
        XCTAssertEqual(viewController.loginLabel.text, "johndoe")
        XCTAssertEqual(viewController.locationLabel.text, "New York")
        XCTAssertEqual(viewController.companyLabel.text, "ABC Inc.")
        XCTAssertEqual(viewController.twitterLabel.text, "johndoe123")
        XCTAssertEqual(viewController.repoCountLabel.text, "10")
        XCTAssertEqual(viewController.folowersLabel.text, "100")
        XCTAssertEqual(viewController.createdLabel.text, "12/09/2023 09:00:00")
        XCTAssertEqual(viewController.updatedLabel.text, "13/09/2023 11:30:00")
        XCTAssertEqual(viewController.bioLabel.text, "A software developer")
    }

    func testButtonActionCallsNavigateToRepositories() {
        viewController.buttonAction(UIButton())
        XCTAssertTrue(viewModelMock.navigateToRepositoriesCalled)
    }
}

class UserDetailViewModelMock: UserDetailViewModel {
    var fetchUserDetailCalled = false
    var navigateToRepositoriesCalled = false
    
    override func fetchUserDetail() {
        fetchUserDetailCalled = true
    }
    
    override func navigateToRepositories(user: UserDetailViewModel) {
        navigateToRepositoriesCalled = true
    }
}
