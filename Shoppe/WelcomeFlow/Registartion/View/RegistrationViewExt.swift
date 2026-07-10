//
//  RegistrationViewExt.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit

extension RegistrationView {
    
    enum Title {
        static let label = "Create Account"
        static let emailTextfield = "Email"
        static let passwordTextfield = "Password"
        static let number = "Your number"
        static let sendButton = "Done"
        static let cancelButton = "Cancel"
    }
    enum Color {
        static let mainColor: UIColor = .white
        static let secondColor: UIColor = .appMain
        static let grayColor: UIColor = .appGray
    }
    enum Font {
        static func nunitoSansLight(size: CGFloat) -> UIFont {
            return UIFont(name: "NunitoSans-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
        }
        static func ralewayBold(size: CGFloat) -> UIFont {
            return UIFont(name: "Raleway-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    enum Image {
        static let britishFlag: UIImage = .britishFlag
    }
}
