//
//  LoginViewController.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    
}
