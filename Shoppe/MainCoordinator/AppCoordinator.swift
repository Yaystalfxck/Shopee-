//
//  AppCoordinator.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

class AppCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Any] = []
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let AuthFlowCoordinator = AuthFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(AuthFlowCoordinator)
        AuthFlowCoordinator.showWelcome()
    }
    
    
}


