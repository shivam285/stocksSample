//
//  ViewFromNib.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

protocol ViewFromNib {}

extension ViewFromNib {
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
    static func view() -> Self? {
        let objects = self.nib.instantiate(withOwner: nil, options: nil)
        return objects.first as? Self
    }
    
    static func viewController<T: UIViewController>() -> T? {
        return T(nibName: nibName, bundle: nil)
    }
}

