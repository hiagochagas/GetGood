//
//  UIView.swift
//  GetGood
//
//  Created by Hiago Chagas on 17/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
