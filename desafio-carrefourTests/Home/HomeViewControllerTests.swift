//
//  HomeViewControllerTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class HomeViewControllerTests: XCTestCase {

    var viewController: MockHomeViewController!
    var navigationController: UINavigationController!
    var coordinator: HomeCoordinator!

    override func setUpWithError() throws {
        super.setUp()
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        self.coordinator = MockHomeCoordinator(window: window)
        self.coordinator.start()
        self.viewController = (window.rootViewController as? UINavigationController)?.viewControllers.first as? MockHomeViewController
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testFetchUsersCall() {
        let viewModelMock = MockHomeViewModel()
        viewController.viewModel = viewModelMock
        viewController.viewDidLoad()
        XCTAssertTrue(viewModelMock.fetchUsersCalled)
    }

    func testReloadData() {
        let viewModelMock = MockHomeViewModel()
        viewController.viewModel = viewModelMock
        viewModelMock.delegate = viewController

        viewModelMock.delegate?.reloadData()

        XCTAssertTrue(viewController.reloadDataCalled)
    }
}
