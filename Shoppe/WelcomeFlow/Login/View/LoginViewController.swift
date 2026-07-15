//
//  LoginViewController.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    var TapDone: (() -> Void)?
    var TapEscape: (() -> Void)?
    
    let loginView = LoginView()
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
        loginView.tapDone = {[weak self] in
            self?.handlertap()
        }
        loginView.tapEscape = {[weak self] in
            self?.TapEscape?()
        }
        
        loginViewModel.onError = {[weak self] error in
            self?.showError(error)
        }
        loginViewModel.isComplete = {[weak self] in
            self?.TapDone?()
        }
        
        
        
        
    }
    private func handlertap() {
        loginViewModel.checkMail(mail: loginView.emailTextField.text)
    }
    
    private func showError(_ message: String) {
       let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "OK", style: .default))
       present(alert, animated: true)
   }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    
}
