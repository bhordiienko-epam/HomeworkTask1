//
//  MockLogInScreen.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
@testable import HomeworkTask1

class MockLogInScreen: LogInViewProtocol {
    var isShowAlerCalled: Bool = false
    func showAlert() {
        isShowAlerCalled = true
    }
}
