//
//  LoginViewModel.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation

class LoginViewModel {
    
    private let userData = UserData.shared
    
    var onError: ((String) -> Void)?
    var isComplete: (() -> Void)?
    
    func checkMail(mail: String?) {
        guard let mail = mail, !mail.isEmpty else{
            onError?("Mail is Empty")
            return
        }
        guard userData.isEmailTaken(mail) else {
            onError?("Account not found")
            return
        }
        isComplete?()
    }
}
