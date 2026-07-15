//
//  LoginView.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    var tapDone: (() -> Void)?
    var tapEscape: (() -> Void)?
    
    
    private let blueBlobShape = CAShapeLayer()
    private let whiteGrayBlobShape = CAShapeLayer()
    private let GrayBlobShape = CAShapeLayer()
    private let blueBlobSecondShape = CAShapeLayer()
    private let bottomRightShape = CAShapeLayer()
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.text = Title.label
        lbl.font = Font.ralewayBold(size: 52)
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
return lbl
}()
    private let secondLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = Title.label2
    lbl.font = Font.nunitoSansLight(size: 19)
    lbl.textColor = .black
    lbl.textAlignment = .left
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
}()
     let emailTextField: UITextField = {
    let txtField = UITextField()
    txtField.placeholder = Title.emailTextfield
    txtField.backgroundColor = Color.whitegrayColor
    txtField.textColor = .black
    txtField.font = Font.nunitoSansLight(size: 16)
    txtField.layer.cornerRadius = 25
    txtField.translatesAutoresizingMaskIntoConstraints = false
    txtField.keyboardType = .default
    txtField.setLeftPaddingPoints(20)
    txtField.setRightPaddingPoints(10)
    txtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    return txtField
    
}()
    let nextButton: UIButton = {
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
    lazy var hStack: UIStackView = Hstack()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        addSubview(emailTextField)
        addSubview(hStack)
        addSubview(nextButton)
        addSubview(cancelButton)
        
        nextButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapReturn))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
        setupConstraints()
        
        
        
    }
    
    override func layoutSubviews() {
        drawBlueBlob()
        drawLightBlob()
        drawSecondBlueBlob()
        drawGreyBlueBlob()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func drawBlueBlob() {
        let radius = bounds.width * 0.7
        let path = UIBezierPath()

        
        path.move(to: CGPoint(x: 0, y: 0))

        
        path.addLine(to: CGPoint(x: radius, y: 0))
        path.addArc(
               withCenter: CGPoint(x: 0, y: 0),
               radius: radius,
               startAngle: 0,
               endAngle: .pi / 2,
               clockwise: true
           )

        path.close()
        
        
        blueBlobShape.path = path.cgPath
        blueBlobShape.fillColor = Color.secondColor.cgColor
        layer.addSublayer(blueBlobShape)
        
    }
    private func drawLightBlob() {
        let width = bounds.width
        let height = bounds.height

        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0, y: 0))

        
        path.addLine(to: CGPoint(x: width * 0.80, y: 0))

        path.addCurve(
            to: CGPoint(x: width * 0.55, y: height * 0.35),
            controlPoint1: CGPoint(x: width * 0.75, y: height * 0.08),
            controlPoint2: CGPoint(x: width * 0.60, y: height * 0.22)
        )

       
        path.addCurve(
            to: CGPoint(x: 0, y: height * 0.25),
            controlPoint1: CGPoint(x: width * 0.50, y: height * 0.48),
            controlPoint2: CGPoint(x: width * 0.15, y: height * 0.45)
        )

        
        path.close()

        
       
        whiteGrayBlobShape.path = path.cgPath
        
        
        whiteGrayBlobShape.fillColor = Color.secondColor.withAlphaComponent(0.2).cgColor
        
        
        layer.insertSublayer(whiteGrayBlobShape, at: 0)
    }
    private func drawSecondBlueBlob() {
        let width = bounds.width
        let height = bounds.height
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: width * 1, y: height * 0.40))
        
        
        path.addCurve(
            to: CGPoint(x: width * 0.80, y: height * 0.50),
            controlPoint1: CGPoint(x: width * 0.88, y: height * 0.40),
            controlPoint2: CGPoint(x: width * 0.78, y: height * 0.45))
        
        path.addCurve(
            to: CGPoint(x: width * 1, y: height * 0.60),
            controlPoint1: CGPoint(x: width * 0.82, y: height * 0.56),
            controlPoint2: CGPoint(x: width * 0.94, y: height * 0.60))
        
        path.close()
        
        blueBlobSecondShape.path = path.cgPath
        
        blueBlobSecondShape.fillColor = Color.secondColor.cgColor
        layer.insertSublayer(blueBlobSecondShape, at: 0)
    }
    private func drawGreyBlueBlob() {
            let width = bounds.width
            let height = bounds.height
            
            let path = UIBezierPath()
            let center = CGPoint(x: width * 1.35, y: height * 1.05)
            
            let radius = width * 0.70
            
        path.move(to: CGPoint(x: width, y: height * 0.78))
        
            path.addArc(
                withCenter: center,
                radius: radius,
                startAngle: .pi * 1.3,
                endAngle: .pi * 0.6,
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: width, y: height))
            
            path.close()
            
           
            bottomRightShape.path = path.cgPath
            
          
            bottomRightShape.fillColor = Color.whitegrayColor.cgColor
            layer.insertSublayer(bottomRightShape, at: 0)
        }
    private func Hstack() -> UIStackView {
        let image: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(systemName: "heart.fill")
            img.heightAnchor.constraint(equalToConstant: 15).isActive = true
            img.widthAnchor.constraint(equalToConstant: 15).isActive = true
            img.contentMode = .scaleAspectFit
            img.tintColor = .black
            img.translatesAutoresizingMaskIntoConstraints = false
            img.setContentCompressionResistancePriority(.required, for: .horizontal)
            return img
        }()
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 10
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.alignment = .fill
        
        hStack.addArrangedSubview(secondLabel)
        hStack.addArrangedSubview(image)
        return hStack
    }
    @objc private func tapReturn() {
        endEditing(true)
    }
    @objc private func sendAction() {
        tapDone?()
    }
    @objc private func cancelAction() {
        tapEscape?()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
           
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 460),

            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            hStack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
            
            
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            emailTextField.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 40),
            
            
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            nextButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 45),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            cancelButton.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
