//
//  RegistrationViewController.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    var registrationViewModel = RegistrationViewModel.shared
    let registrationView = RegistrationView()
    var buttonAction: (() -> Void)?
    var buttonActionRegistartion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view = registrationView
        
        registrationView.buttonTappedAction = {[weak self] in
            self?.buttonAction?()
        }
        
        registrationView.buttonTappedActionDone = {[weak self] in
            self?.handlerDoneTapped()
        }
        
        registrationViewModel.onRegistrationSuccess = {[weak self] in
            self?.buttonActionRegistartion?()
        }
        registrationViewModel.onError = {[weak self] error in
            self?.showError(error)
        }
    }
    private func handlerDoneTapped() {
        registrationViewModel.register(name: nil, email: registrationView.emailTextField.text, password: registrationView.passwordTextField.text, number: registrationView.phoneTextField.text)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}
