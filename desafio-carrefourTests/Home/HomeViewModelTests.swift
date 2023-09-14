//
//  HomeViewModelTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class HomeViewModelTests: XCTestCase {
    
    // Mock para simular o comportamento do Coordinator e do Delegate
    class MockCoordinator: HomeCoordinator {
        var callNavigateToUser = false
        // Implemente os métodos necessários para os testes
        override func navigateToUser(user: UserViewModel) {
            self.callNavigateToUser = true
        }
    }
    
    class MockDelegate: HomeViewModelDelegate {
        var reloadDataCalled = false
        
        func reloadData() {
            reloadDataCalled = true
        }
    }
    
    class MockHomeViewModel: HomeViewModel {
        func setUsersMock(users: [UserViewModel]) {
            self.users = users
        }
        override func fetchUsers() {
            if !(self.users?.isEmpty ?? true) {
                self.delegate?.reloadData()
            }
        }
    }
    
    var window: UIWindow!
    var mockViewModel: MockHomeViewModel!
    var mockCoordinator: MockCoordinator!
    var mockDelegate: MockDelegate!
    
    override func setUpWithError() throws {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        mockViewModel = MockHomeViewModel()
        mockCoordinator = MockCoordinator(window: self.window)
        mockDelegate = MockDelegate()
        
        mockViewModel.coordinator = mockCoordinator
        mockViewModel.delegate = mockDelegate
    }
    
    override func tearDownWithError() throws {
        mockViewModel = nil
        mockCoordinator = nil
        mockDelegate = nil
        window = nil
        super.tearDown()
    }
    
    func testFetchUsersSuccess() {
        let mockUsers = [UserViewModel(user: User()), UserViewModel(user: User())]
        mockViewModel.setUsersMock(users: mockUsers)
        mockViewModel.fetchUsers()
        
        let expectation = XCTestExpectation(description: "Fetch Users")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mockViewModel.users?.count == 2)
            XCTAssertTrue(self.mockDelegate.reloadDataCalled)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchUsersEmptyResponse() {
        mockViewModel.setUsersMock(users: [])
        mockViewModel.fetchUsers()
                
        let expectation = XCTestExpectation(description: "Fetch Users")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(self.mockViewModel.users?.isEmpty ?? false)
            XCTAssertFalse(self.mockDelegate.reloadDataCalled)

            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCalNavigateToUser() {
        XCTAssertEqual(self.mockCoordinator.callNavigateToUser, false)
        
        self.mockCoordinator.navigateToUser(user: UserViewModel(user: User()))
        XCTAssertEqual(self.mockCoordinator.callNavigateToUser, true)
    }
}
