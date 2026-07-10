//
//  ViewController.swift
//  Shoppe
//
//  Created by Sergey on 09.07.2026.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var onRegisterTapped: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let welcomeView = WelcomeView()
        welcomeView.onButtonTapped = {[weak self] in
            self?.onRegisterTapped?()
            
        }
        self.view = welcomeView
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    
}

