//
//  TrendingView.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 21/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

enum TrendingItem: CaseIterable {
    case item1, item2
    
    static var titles = [item1: "Stocks", item2: "ETFs"]
    
    static var images = [item1: "img1", item2: "img2"]
    
    static var colors = [item1: UIColor.green, item2: UIColor.red]
    
    var title: String {
        return TrendingItem.titles[self] ?? ""
    }
    
    var image: String {
        return TrendingItem.images[self] ?? ""
    }
    
    var color: UIColor {
        return TrendingItem.colors[self] ?? UIColor.red
    }
    
}


class TrendingView: UIView {
    
    var tvTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tvTableView = UITableView()
        tvTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tvTableView)
        Constraint.pinAllEdgesOfSubview(subview: tvTableView, superView: self)
        
        tvTableView.delegate = self
        tvTableView.dataSource = self
        tvTableView.tableFooterView = UIView()
        
        tvTableView.register(UINib(nibName: TrendingTableViewCell.kIdentifier, bundle: nil), forCellReuseIdentifier: TrendingTableViewCell.kIdentifier)
    }
}


extension TrendingView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TrendingItem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.kIdentifier) as? TrendingTableViewCell else {
                return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(withItem: TrendingItem.allCases[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top Gainers"
        }
        
        return "Top Sellers"
    }
}
