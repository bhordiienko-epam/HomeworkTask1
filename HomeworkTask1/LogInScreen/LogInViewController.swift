//
//  ViewController.swift
//  HomeworkTask1
//
//  Created by Bohdan on 05.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var viewModel: LoginViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(view: self)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        viewModel.signIn(login: loginField.text, password: passwordField.text)
    }
}

extension LogInViewController: LogInViewProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Sign In Failed!",
                                      message: "Hardcoded login: user \n password: 123qwe",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}
