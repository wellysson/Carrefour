//
//  HomeCoordinatorTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 13/09/23.
//

import XCTest
@testable import desafio_carrefour

final class HomeCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var coordinator: HomeCoordinator!
    var window: UIWindow!
    
    override func setUpWithError() throws {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController()
        coordinator = HomeCoordinator(window: self.window)
    
    }

    override func tearDownWithError() throws {
        navigationController = nil
        coordinator = nil
        super.tearDown()
    }

    func testStart() {
        // Execute o método start
        coordinator.start()

        XCTAssertTrue(self.window.rootViewController is UINavigationController)
        
        // Verifique se a navigationController possui pelo menos um viewController
        XCTAssertTrue((self.window.rootViewController as? UINavigationController)?.viewControllers.count ?? 0 > 0)

        // Verifique se o primeiro viewController é uma instância de RegistrationViewController
        XCTAssertTrue((self.window.rootViewController as? UINavigationController)?.viewControllers.first is HomeViewController)
    }
}
