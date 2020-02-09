//
//  LogInCoordinatorTests.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import XCTest
@testable import HomeworkTask1

class LogInCoordinatorTestsTests: XCTestCase {
    
    var logInCoordinator: MockLogInCoordinator!
    
    override func setUp() {
        super.setUp()
        logInCoordinator = MockLogInCoordinator()
    }
    
    override func tearDown() {}
    
    func testStart() {
        logInCoordinator.start()
        XCTAssertTrue(logInCoordinator.isStartCalled)
    }
    
    func testShowListScreen() {
        logInCoordinator.showListScreen()
        
        XCTAssertNotNil(logInCoordinator.childCoordinators.first)
        guard let listCoordinator = logInCoordinator.childCoordinators.first as? MockListScreenCoordinator else {
            XCTFail()
            return
        }
        XCTAssertTrue(listCoordinator.isStartCalled)
    }
}
