//
//  WelcomeViewModelExtension .swift
//  Shoppe
//
//  Created by Sergey on 09.07.2026.
//

import Foundation
import UIKit

extension WelcomeView {
    
    enum Font {
        static func nunitoSansLight(size: CGFloat) -> UIFont {
            return UIFont(name: "NunitoSans-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
        }
        static func ralewayBold(size: CGFloat) -> UIFont {
                    return UIFont(name: "Raleway-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
                }
    }
    enum Text {
        static let mainText: String = "Shoppe"
        static let aboutText: String = "Beautiful eCommerce UI Kit for your online store"
        static let buttonText: String = "Let's get started"
        static let underText: String = "I already have an account"
    }
    enum Color {
        static let mainColor: UIColor = .white
        static let secondColor: UIColor = .appMain
    }
    
    enum Image {
        static let logo: UIImage = .welcomFlow
    }
    
}
