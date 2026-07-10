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
        static let label = "Create\nAccount"
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
extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
