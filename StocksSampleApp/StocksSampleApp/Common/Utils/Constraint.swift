//
//  Constraint.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

public struct Constraint {
    
    public static func pinSubview(subview: UIView?, superView: UIView,
                                  attribute: NSLayoutConstraint.Attribute, constant: CGFloat) {
        
        superView.addConstraint(NSLayoutConstraint(item: superView,
                                                   attribute: attribute, relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: subview, attribute: attribute, multiplier: 1.0,
                                                   constant: constant))
        
    }
    
    public static func pinAllEdgesOfSubview(subview: UIView, superView: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        pinSubview(subview: subview,
                   superView: superView, attribute: NSLayoutConstraint.Attribute.bottom,
                   constant: 0.0)
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.top, constant: 0.0)
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.leading, constant: 0.0)
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.trailing, constant: 0.0)
    }
    
    public static func pinCenterOfSubview(subview: UIView, superView: UIView) {
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.centerX, constant: 0.0)
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.centerY, constant: 0.0)
    }
    
    public static func subviewHeight(subview: UIView, superView: UIView, constant: CGFloat) {
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.height, constant: constant)
    }
    
    public static func subviewWidth(subview: UIView, superView: UIView, constant: CGFloat) {
        pinSubview(subview: subview, superView: superView,
                   attribute: NSLayoutConstraint.Attribute.width, constant: constant)
    }
}
