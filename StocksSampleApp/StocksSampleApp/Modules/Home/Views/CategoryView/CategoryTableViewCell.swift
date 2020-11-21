//
//  CategoryTableViewCell.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 21/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static var kIdentifier = "CategoryTableViewCell"
    
    @IBOutlet var ivImageView: UIImageView!
    @IBOutlet var lTitleLabel: UILabel!
    @IBOutlet var vContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vContainerView.layer.cornerRadius = 31
        vContainerView.layer.borderColor = UIColor.clear.cgColor
        vContainerView.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withItem item: CategoryItem) {
        lTitleLabel.text = item.title
        vContainerView.backgroundColor = item.color
    }
    
}
