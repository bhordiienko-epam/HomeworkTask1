//
//  LogInScreenContracts.swift
//  HomeworkTask1
//
//  Created by Bohdan on 07.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation

protocol LogInViewProtocol: AnyObject {
    func showAlert()
}

protocol LoginViewModelProtocol {
    var coordinator: LogInCoordinatorProtocol? { get set }
    var view: LogInViewProtocol? { get set }
    
    func onViewDidLoad(view: LogInViewProtocol?)
    func signIn(login: String?, password: String?)
}

protocol LogInCoordinatorProtocol: AnyObject, Coordinator {
    func showListScreen()
}
