//
//  MockListScreenCoordinator.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import UIKit
@testable import HomeworkTask1

class MockListScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController = UINavigationController()
    
    var isStartCalled: Bool = false
    
    func start() {
        isStartCalled = true
    }
}
