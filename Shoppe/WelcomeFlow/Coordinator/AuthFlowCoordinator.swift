//
//  WelcomeFlowCoordinator.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

class AuthFlowCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showRegistartion() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(registrationViewController, animated: true)
        
        registrationViewController.buttonAction = {[weak self] in
            self?.navigationController.popViewController(animated: true)
        }
            
}
    
    func showWelcome() {
        let welcomeViewController = WelcomeViewController()
        
        welcomeViewController.onRegisterTapped = { [weak self] in
            self?.showRegistartion()
        }
        
        welcomeViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
    
}
