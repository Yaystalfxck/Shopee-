//
//  WelcomeView.swift
//  Shoppe
//
//  Created by Sergey on 09.07.2026.
//

import Foundation
import UIKit


class WelcomeView: UIView {
    
    private let logo: UIImageView =  {
        let img = UIImageView()
        img.image = Image.logo
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.heightAnchor.constraint(equalToConstant: 80).isActive = true
        img.widthAnchor.constraint(equalToConstant:  92).isActive = true
        
        return img
    }()
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.mainColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        view.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        view.layer.cornerRadius = 70
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 12
        
        view.clipsToBounds = false
        return view
    }()
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = Text.mainText
        label.font = Font.ralewayBold(size: 52)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = Text.aboutText
        label.font = Font.nunitoSansLight(size: 19)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle(Text.buttonText, for: .normal)
        button.titleLabel?.font = Font.nunitoSansLight(size: 20)
        button.titleLabel?.textColor = .white
        button.backgroundColor = Color.secondColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let lastLabel: UILabel = {
        let label = UILabel()
        label.text = Text.underText
        label.font = Font.nunitoSansLight(size: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let buttonCircle: UIButton = {
        let image = UIImage(systemName: "arrow.right")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.backgroundColor = Color.secondColor
        button.layer.cornerRadius = 15
        button.imageView?.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    private lazy var stack: UIStackView = lastStack()
    
    var onButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = Color.mainColor
        StackLogo()
        
        self.addSubview(circleView)
        self.addSubview(mainLabel)
        self.addSubview(secondLabel)
        self.addSubview(button)
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 25),
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            secondLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            button.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 100),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            stack.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor)
            
            
            
            
        ])
        
    }
    
    private func StackLogo() {
        circleView.addSubview(logo)
        
        
        
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 21),
            logo.centerXAnchor.constraint(equalTo: circleView.centerXAnchor)
        ])
        
    }
    
    private func lastStack() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [lastLabel, buttonCircle])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }
    
    @objc func buttonTapped() {
        onButtonTapped?()
    }
}
