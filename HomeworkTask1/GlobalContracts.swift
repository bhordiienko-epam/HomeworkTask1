//
//  GlobalContracts.swift
//  HomeworkTask1
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol NetworkingManagerProtocol {
    func loadList(url: URL?, completionHandler: @escaping (ListModel?, Error?) -> Void) 
    func load(url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}
