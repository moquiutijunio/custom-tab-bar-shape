//
//  CustomTabBar.swift
//  BottomAppBar
//
//  Created by Junio Moquiuti on 20/02/20.
//  Copyright © 2020 Junio Moquiuti. All rights reserved.
//

import UIKit

final class CustomTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    lazy var middleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 56, height: 56)
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.setImage(UIImage(named: "ic_more"), for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        addSubview(button)
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyAppearance()
    }
    
    override func draw(_ rect: CGRect) {
        
        addShape()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }

        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }

        return nil
    }
    
    private func applyAppearance() {
        
        barTintColor = .clear
        shadowImage = UIImage()
        backgroundImage = UIImage()
        tintColor = .white
    }
}
 
// MARK: - Custom Layer
extension CustomTabBar {
    
    private func addShape() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor(white: 0, alpha: 0.87).cgColor
        shapeLayer.fillColor = UIColor(white: 0, alpha: 0.87).cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.shadowColor = UIColor.clear.cgColor
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        
        let height = frame.height
        let radius: CGFloat =  37
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: ((frame.width/2) - radius), y: 0))
        path.addArc(withCenter: CGPoint(x: (frame.width/2), y: 0), radius: radius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(0), clockwise: false)
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: height + 100))
        path.addLine(to: CGPoint(x: 0, y: height + 100))
        path.close()
        
        return path.cgPath
    }
}
