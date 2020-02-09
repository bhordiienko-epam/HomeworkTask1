//
//  LoginViewModel.swift
//  HomeworkTask1
//
//  Created by Bohdan on 05.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation


class LoginViewModel: LoginViewModelProtocol {
    var coordinator: LogInCoordinatorProtocol?
    weak var view: LogInViewProtocol?
    
    private let hardcodedLogin = "user"
    private let hardcodedPassword = "123qwe"
    
    func onViewDidLoad(view: LogInViewProtocol?) {
        self.view = view
    }
    
    func signIn(login: String?, password: String?) {
        guard let login = login,
            let password = password,
            login == hardcodedLogin && password == hardcodedPassword
        else {
            view?.showAlert()
            return
        }

        coordinator?.showListScreen()
    }
}
