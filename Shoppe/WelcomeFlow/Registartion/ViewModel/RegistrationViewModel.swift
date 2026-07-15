//
//  RegistationViewModel.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation


class RegistrationViewModel {
    
    private let userData = UserData.shared
    
    var onError: ((String) -> Void)?
    var onRegistrationSuccess: (() -> Void)?
    
    func register(name: String?, email: String?, password: String?, number: String?) {
        
        guard let email = email, isValidEmail(email) else {
            onError?("Dont valid email")
            return
        }
        
        guard !userData.isEmailTaken(email) else {
            onError?("User already exists")
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
        
        userData.add(name: name ?? "", email: email, password: password, number: number)
        
        onRegistrationSuccess?()
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
