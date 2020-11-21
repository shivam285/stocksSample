//
//  TrendingTableViewCell.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 21/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static var kIdentifier = "TrendingTableViewCell"
    
    @IBOutlet var lTitleLabel: UILabel!
    @IBOutlet var lSubtitleTitleLabel: UILabel!
    @IBOutlet var vScoreView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        vScoreView.layer.cornerRadius = 10
        vScoreView.layer.borderColor = UIColor.clear.cgColor
        vScoreView.layer.borderWidth = 1.0
        // Configure the view for the selected state
    }
    
    func configure(withItem item: TrendingItem) {
        lTitleLabel.text = item.title
        lSubtitleTitleLabel.text = item.title
        
    }
    
}
