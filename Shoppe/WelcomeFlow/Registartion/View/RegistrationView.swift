//
//  RegistrationView.swift
//  Shoppe
//
//  Created by Sergey on 10.07.2026.
//

import Foundation
import UIKit


class RegistrationView: UIView {
   
    private var blueBlobLayer = CAShapeLayer()
    private var lightBlobLayer = CAShapeLayer()
    private var dashedCircleLayer = CAShapeLayer()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = Title.label
        label.font = Font.ralewayBold(size: 50)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let avatarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let image = UIImage(systemName: "camera", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = Color.secondColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var emailTextField: UITextField = makeTextField(placeholder: Title.emailTextfield)
    lazy var passwordTextField: UITextField = makeTextField(placeholder: Title.passwordTextfield, isSecure: true)
    lazy var phoneTextField: UITextField = makeTextField(placeholder: Title.number, keyboardType: .phonePad)
    
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView(image: Image.britishFlag)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let chevronImageView: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: 14, weight: .regular)
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down", withConfiguration: config))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle(Title.sendButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.nunitoSansLight(size: 20)
        button.backgroundColor = Color.secondColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle(Title.cancelButton, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = Font.nunitoSansLight(size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonTappedAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupBackgroundShapes()
        setupLayout()
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawBlueBlob()
        drawDashedCircle()
        
    }
    
    
    
    private func makeTextField(placeholder: String, isSecure: Bool = false, keyboardType: UIKeyboardType = .default) -> UITextField {
        let txtField = UITextField()
        txtField.placeholder = placeholder
        txtField.backgroundColor = Color.grayColor
        txtField.textColor = .black
        txtField.font = Font.nunitoSansLight(size: 16)
        txtField.layer.cornerRadius = 25
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.isSecureTextEntry = isSecure
        txtField.keyboardType = keyboardType
        txtField.setLeftPaddingPoints(20)
        txtField.setRightPaddingPoints(10)
        txtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return txtField
    }
    
   
    
    private func setupBackgroundShapes() {
        blueBlobLayer.fillColor = Color.secondColor.cgColor
        layer.addSublayer(blueBlobLayer)
        
        lightBlobLayer.fillColor = Color.grayColor.cgColor
        layer.addSublayer(lightBlobLayer)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 260, y: 0))
        path.addCurve(
            to: CGPoint(x: 180, y: 200),
            controlPoint1: CGPoint(x: 240, y: 60),
            controlPoint2: CGPoint(x: 220, y: 140)
        )
        path.addCurve(
            to: CGPoint(x: 0, y: 260),
            controlPoint1: CGPoint(x: 120, y: 260),
            controlPoint2: CGPoint(x: 60, y: 280)
        )
        path.close()
        lightBlobLayer.path = path.cgPath
    }
    
    private func drawBlueBlob() {
        let width: CGFloat = 160
        let height: CGFloat = 280
        let originX = bounds.width - width + 20
        let originY: CGFloat = 100
        
        let rightX = bounds.width + 20
        let topY = originY
        let bottomY = originY + height
        let midY = originY + height / 2
        let leftX = originX
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rightX, y: topY))
        
        path.addCurve(
            to: CGPoint(x: leftX, y: midY),
            controlPoint1: CGPoint(x: rightX - width * 0.9, y: topY + height * 0.15),
            controlPoint2: CGPoint(x: leftX, y: midY - height * 0.25)
        )
        
        path.addCurve(
            to: CGPoint(x: rightX, y: bottomY),
            controlPoint1: CGPoint(x: leftX, y: midY + height * 0.25),
            controlPoint2: CGPoint(x: rightX - width * 0.6, y: bottomY)
        )
        
        path.addLine(to: CGPoint(x: rightX, y: topY))
        path.close()
        
        blueBlobLayer.path = path.cgPath
    }
    
    
    
    private func setupLayout() {
        addSubview(mainLabel)
        addSubview(avatarContainer)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(phoneTextField)
        addSubview(doneButton)
        addSubview(cancelButton)
        avatarContainer.addSubview(cameraButton)
        
        
        phoneTextField.addSubview(flagImageView)
        phoneTextField.addSubview(chevronImageView)
        phoneTextField.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            avatarContainer.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 60),
            avatarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            avatarContainer.widthAnchor.constraint(equalToConstant: 100),
            avatarContainer.heightAnchor.constraint(equalToConstant: 100),
            
            cameraButton.centerXAnchor.constraint(equalTo: avatarContainer.centerXAnchor),
            cameraButton.centerYAnchor.constraint(equalTo: avatarContainer.centerYAnchor),
            cameraButton.widthAnchor.constraint(equalToConstant: 32),
            cameraButton.heightAnchor.constraint(equalToConstant: 28),
            
            emailTextField.topAnchor.constraint(equalTo: avatarContainer.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            phoneTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            
            flagImageView.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor, constant: 20),
            flagImageView.centerYAnchor.constraint(equalTo: phoneTextField.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 28),
            flagImageView.heightAnchor.constraint(equalToConstant: 20),
            
           
            chevronImageView.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 6),
            chevronImageView.centerYAnchor.constraint(equalTo: phoneTextField.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 14),
            chevronImageView.heightAnchor.constraint(equalToConstant: 14),
           
            separatorView.leadingAnchor.constraint(equalTo: chevronImageView.trailingAnchor, constant: 12),
            separatorView.centerYAnchor.constraint(equalTo: phoneTextField.centerYAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.heightAnchor.constraint(equalToConstant: 24),
            
            doneButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 40),
            doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            doneButton.heightAnchor.constraint(equalToConstant: 60),
            
            cancelButton.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 20),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
       
        phoneTextField.setLeftPaddingPoints(100)
    }
    
   
    
    private func drawDashedCircle() {
        dashedCircleLayer.removeFromSuperlayer()
        
        let radius = min(avatarContainer.bounds.width, avatarContainer.bounds.height) / 2 - 2
        let path = UIBezierPath(
            arcCenter: CGPoint(x: avatarContainer.bounds.midX, y: avatarContainer.bounds.midY),
            radius: radius,
            startAngle: 0,
            endAngle: .pi * 2,
            clockwise: true
        )
        
        dashedCircleLayer.path = path.cgPath
        dashedCircleLayer.strokeColor = Color.secondColor.cgColor
        dashedCircleLayer.fillColor = UIColor.clear.cgColor
        dashedCircleLayer.lineWidth = 2.5
        dashedCircleLayer.lineDashPattern = [10, 8]
        dashedCircleLayer.lineCap = .round
        
        avatarContainer.layer.addSublayer(dashedCircleLayer)
    }
    
    @objc private func cancel() {
        buttonTappedAction?()
    }
}
