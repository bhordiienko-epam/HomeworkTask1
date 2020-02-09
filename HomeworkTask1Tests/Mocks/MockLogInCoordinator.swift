//
//  MockLogInCoordinator.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import UIKit
@testable import HomeworkTask1

class MockLogInCoordinator: LogInCoordinatorProtocol {
    var childCoordinators: [Coordinator] = [MockListScreenCoordinator()]
    var navigationController: UINavigationController = UINavigationController()
    
    var isStartCalled: Bool = false
    
    func start() {
        isStartCalled = true
    }
    
    func showListScreen() {
         childCoordinators.first?.start()
    }
}

