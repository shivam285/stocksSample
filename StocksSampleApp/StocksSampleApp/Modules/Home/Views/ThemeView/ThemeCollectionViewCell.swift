//
//  ThemeCollectionViewCell.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 21/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {

    static var kIdentifier = "ThemeCollectionViewCell"
    
    @IBOutlet var lTitleLabel: UILabel!
    @IBOutlet var ivImageView: UIImageView!
    @IBOutlet var vContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vContainerView.layer.cornerRadius = 4.0
        vContainerView.layer.borderWidth = 0.5
        vContainerView.layer.borderColor = UIColor.lightGray.cgColor
    }

}
