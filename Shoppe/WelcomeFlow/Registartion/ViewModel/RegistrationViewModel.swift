//
//  RegistationViewModel.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation


class RegistrationViewModel {
    
    private(set) var users: [RegistrationModel] = []
    
    static let shared = RegistrationViewModel()
    
    var onError: ((String) -> Void)?
    
    var onRegistrationSuccess: (() -> Void)?
    
    func register(name: String?, email: String?, password: String?, number: String?) {
        
        guard !users.contains(where: { $0.email == email }) else {
            onError?("User already exists")
            return
        }
        
        guard let email = email else {
            onError?("Dont valid email")
            return
        }
        guard let password = password, password.count >= 6 else {
            onError?("Password")
            return
        }
        guard let number = number, number.count >= 10 else {
            onError?("Dont valid number")
            return
        }
        let model = RegistrationModel(
            name: name ?? "",
            email: email,
            password: password,
            number:  number
        )
        
        users.append(model)
        
        onRegistrationSuccess?()
    }
    
}
