//
//  ListScreenCoordinator.swift
//  HomeworkTask1
//
//  Created by Bohdan on 06.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import UIKit

class ListScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = instantiateListScreen()
        vc.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: true)
    }
    
    private func instantiateListScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "ListStoryboard", bundle: Bundle.main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "listScreenStoryboard") as? ListTableViewController else { fatalError() }
        let viewModel = ListViewModel(networkingManager: NetworkingManager.shared)
        controller.viewModel = viewModel
        
        return controller
    }
}
