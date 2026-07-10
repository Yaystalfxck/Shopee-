//
//  RegistrationViewController.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registrationView = RegistrationView()
        self.view = registrationView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
