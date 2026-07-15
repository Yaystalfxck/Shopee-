//
//  LoginView.swift
//  Shoppe
//
//  Created by Sergey on 11.07.2026.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let blueBlobShape = CAShapeLayer()
    let whiteGrayBlobShape = CAShapeLayer()
    let GrayBlobShape = CAShapeLayer()
    let blueBlobSecondShape = CAShapeLayer()
    let bottomRightShape = CAShapeLayer()
    
//    let label: UILabel = {
//        let lbl = UILabel()
//        lbl.text = Title.label
//        lbl.font = Font.ralewayBold(size: 52)
//        lbl.textAlignment = .left
//        lbl.font =
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
    
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
    
}
