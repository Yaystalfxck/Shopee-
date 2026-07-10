//
//  RegistrationViewController.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    var buttonAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registrationView = RegistrationView()
        self.view = registrationView
        
        registrationView.buttonTappedAction = {[weak self] in
            self?.buttonAction?()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
