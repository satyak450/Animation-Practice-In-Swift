//
//  PushButton.swift
//  Flo
//
//  Created by Satya Koppu on 12/30/18.
//  Copyright © 2018 Satya Koppu. All rights reserved.
//

import UIKit
@IBDesignable

class PushButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    private struct Constants{
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        if isAddButton{
            let plusHeight: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
            let halfPlusHeight = plusHeight / 2
            
            plusPath.move(to: CGPoint(
                x: halfWidth,
                y: halfHeight - halfPlusHeight))
            plusPath.addLine(to: CGPoint(
                x: halfWidth,
                y: halfHeight + halfPlusHeight))
            
        }
        
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }
    
    var label = "This is a test label for branchings"
    var label2 = "Another test label"

}
