//
//  HomeViewModelTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class HomeViewModelTests: XCTestCase {
    
    var window: UIWindow!
    var mockViewModel: MockHomeViewModel!
    var mockCoordinator: MockHomeCoordinator!
    var mockDelegate: MockDelegate!
    
    override func setUpWithError() throws {
        super.setUp()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        mockViewModel = MockHomeViewModel()
        mockCoordinator = MockHomeCoordinator(window: self.window)
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
