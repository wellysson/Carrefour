//
//  HomeTableViewCellTests.swift
//  desafio-carrefourTests
//
//  Created by Wellysson Avelar on 14/09/23.
//

import XCTest
@testable import desafio_carrefour

class HomeTableViewCellTests: XCTestCase {

    var cell: MockHomeTableViewCell!

    override func setUpWithError() throws {
        cell = MockHomeTableViewCell()
        cell.awakeFromNib()
    }

    override func tearDownWithError() throws {
        cell = nil
    }

    func testConfigureWithViewModel() {
        let user = User()
        user.login = "testUser"
        user.avatarUrl = URL(string: "http://teste")
        let viewModel = UserViewModel(user: user)
        viewModel.login = user.login
        cell.configure(with: viewModel)
        XCTAssertEqual(cell.loginUser, "testUser")
    }

    func testPrepareForReuse() {
        cell.prepareForReuse()
        XCTAssertNil(cell.loginUser)
        XCTAssertNil(cell.urlAvatar)
    }

    func testSetSelected() {
        cell.setSelected(true, animated: false)
        XCTAssertEqual(cell.backgroundColorTest, "#EEEEEE")

        cell.setSelected(false, animated: false)
        XCTAssertEqual(cell.backgroundColorTest, "#FFFFFF")
    }
}
