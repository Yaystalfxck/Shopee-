//
//  LoginViewExt.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation
import UIKit

extension LoginView {
    
    enum Title {
        static let label = "Login"
        static let label2 = "Good to see you back!"
        static let emailTextfield = "Email"
        static let sendButton = "Next"
        static let cancelButton = "Cancel"
    }
    enum Color {
        static let mainColor: UIColor = .white
        static let secondColor: UIColor = .appMain
        static let whitegrayColor: UIColor = .appWiteGray
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
