//
//  LogInViewModelTests.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import XCTest
@testable import HomeworkTask1

class LogInViewModelTests: XCTestCase {
    var logInViewModel: LoginViewModel!
    var logInView: MockLogInScreen!

    let hardcodedLogin = "user"
    let hardcodedPassword = "123qwe"
    
    override func setUp() {
        super.setUp()
        
        let logInCoordinator = MockLogInCoordinator()
        
        logInView = MockLogInScreen()
        logInViewModel = LoginViewModel()
        logInViewModel.coordinator = logInCoordinator
        logInViewModel.onViewDidLoad(view: logInView)
    }
    
    override func tearDown() {}
    
    func testOnViewDidLoad() {
        XCTAssertNotNil(logInViewModel.view)
    }
    
    func testSignInWithoutCreds() {
        logInViewModel.signIn(login: nil, password: nil)
        guard let view = logInViewModel.view as? MockLogInScreen,
            let coordinator = logInViewModel.coordinator?.childCoordinators.first as? MockListScreenCoordinator else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(view.isShowAlerCalled)
        XCTAssertFalse(coordinator.isStartCalled)
    }
    
    func testSignInWithoutLogIn() {
        logInViewModel.signIn(login: nil, password: hardcodedPassword)
        guard let view = logInViewModel.view as? MockLogInScreen,
            let coordinator = logInViewModel.coordinator?.childCoordinators.first as? MockListScreenCoordinator else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(view.isShowAlerCalled)
        XCTAssertFalse(coordinator.isStartCalled)
    }
    
    func testSignInWithoutPassword() {
        logInViewModel.signIn(login: hardcodedLogin, password: nil)
        guard let view = logInViewModel.view as? MockLogInScreen,
            let coordinator = logInViewModel.coordinator?.childCoordinators.first as? MockListScreenCoordinator else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(view.isShowAlerCalled)
        XCTAssertFalse(coordinator.isStartCalled)
    }
    
    func testSignInWithCorrectCreds() {
        logInViewModel.signIn(login: hardcodedLogin, password: hardcodedPassword)
        guard let view = logInViewModel.view as? MockLogInScreen,
            let coordinator = logInViewModel.coordinator?.childCoordinators.first as? MockListScreenCoordinator else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(coordinator.isStartCalled)
        XCTAssertFalse(view.isShowAlerCalled )
    }
}
