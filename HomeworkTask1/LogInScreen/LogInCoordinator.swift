//
//  LogInCoordinator.swift
//  HomeworkTask1
//
//  Created by Bohdan on 05.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import UIKit

class LogInCoordinator: LogInCoordinatorProtocol {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators.append(ListScreenCoordinator(navigationController: navigationController))
    }
    
    func start() {
        let vc = instantiateLogInScreen()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showListScreen() {
        childCoordinators.first?.start()
    }
    
    private func instantiateLogInScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "signInScreen") as? LogInViewController else { fatalError() }
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        controller.viewModel = viewModel
        
        return controller
    }
}
