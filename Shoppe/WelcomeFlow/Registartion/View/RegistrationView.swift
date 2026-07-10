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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupBackgroundShapes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawBlueBlob()
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
        let width: CGFloat = 200
        let height: CGFloat = 340
        let originX = bounds.width - 130
        let originY: CGFloat = 160
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: originX, y: originY + height * 0.15))
        path.addCurve(
            to: CGPoint(x: originX + width * 0.9, y: originY),
            controlPoint1: CGPoint(x: originX + width * 0.1, y: originY - height * 0.05),
            controlPoint2: CGPoint(x: originX + width * 0.5, y: originY - height * 0.1)
        )
        path.addLine(to: CGPoint(x: originX + width, y: originY))
        path.addLine(to: CGPoint(x: originX + width, y: originY + height))
        path.addCurve(
            to: CGPoint(x: originX + width * 0.2, y: originY + height * 0.85),
            controlPoint1: CGPoint(x: originX + width * 0.5, y: originY + height * 1.05),
            controlPoint2: CGPoint(x: originX + width * 0.25, y: originY + height * 0.95)
        )
        path.addCurve(
            to: CGPoint(x: originX, y: originY + height * 0.15),
            controlPoint1: CGPoint(x: originX + width * 0.05, y: originY + height * 0.6),
            controlPoint2: CGPoint(x: originX - width * 0.05, y: originY + height * 0.35)
        )
        path.close()
        
        blueBlobLayer.path = path.cgPath
    }
}
