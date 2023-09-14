//
//  UserDetailCoordinatorTest.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class UserDetailCoordinatorTests: XCTestCase {

    var navigationController: UINavigationController!
    var coordinator: MockUserDetailCoordinator!

    override func setUpWithError() throws {
        navigationController = UINavigationController()
        coordinator = MockUserDetailCoordinator(navigationController: navigationController, login: "testUser")
    }

    override func tearDownWithError() throws {
        navigationController = nil
        coordinator = nil
    }

    func testInitialization() {
        XCTAssertEqual(coordinator.navigationController, navigationController)
        XCTAssertEqual(coordinator.login, "testUser")
        XCTAssertNil(coordinator.repositoriesCoordinator)
    }

    func testStart() {
        coordinator.start()
        XCTAssertNotNil(navigationController.topViewController)
        XCTAssertTrue(navigationController.topViewController is UserDetailViewController)
        let userDetailViewController = navigationController.topViewController as! UserDetailViewController
        XCTAssertNotNil(userDetailViewController.viewModel)
    }

    func testNavigateToRepositories() {
        coordinator.navigateToRepositories(user: UserDetailViewModel(login: "testUser"))
        XCTAssertNotNil(coordinator.repositoriesCoordinator)
    }

    func testShowServiceError() {
        coordinator.start()
        coordinator.showServiceError()
        XCTAssertTrue(coordinator.calledServiceError)
    }
}
