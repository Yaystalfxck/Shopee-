//
//  RegistartionModel.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation

struct RegistrationModel: Codable {
    
    var id: UUID
    var name: String? = ""
    var email: String = ""
    var password: String = ""
    var number: String = ""
}
