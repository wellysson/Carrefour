//
//  RepositoriesCoordinatorTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class RepositoriesCoordinatorTests: XCTestCase {
    var coordinator: MockRepositoriesCoordinator!
    var navigationControllerMock: UINavigationControllerMock!
    
    override func setUpWithError() throws {
        navigationControllerMock = UINavigationControllerMock()
        coordinator = MockRepositoriesCoordinator(navigationController: navigationControllerMock, login: "johndoe")
    }

    override func tearDownWithError() throws {
        coordinator = nil
        navigationControllerMock = nil
    }

    func testStart() {
        coordinator.start()
        XCTAssertTrue(navigationControllerMock.pushViewControllerCalled)
    }

    func testNavigateToRepository() {
        coordinator.navigateToRepository(url: URL(string: "https://example.com")!)
        XCTAssertTrue(coordinator.presentCalled)
    }

    func testShowServiceError() {
        coordinator.showServiceError()
        XCTAssertTrue(navigationControllerMock.presentCalled)
    }
}


class UINavigationControllerMock: UINavigationController {
    var pushViewControllerCalled = false
    var presentCalled = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCalled = true
    }
}

class MockRepositoriesCoordinator: RepositoriesCoordinator {
    var presentCalled = false
    override func navigateToRepository(url: URL) {
        presentCalled = true
    }
}
