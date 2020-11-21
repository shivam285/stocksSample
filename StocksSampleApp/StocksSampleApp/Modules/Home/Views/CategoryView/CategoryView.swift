//
//  CategoryView.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

enum CategoryItem: CaseIterable {
    case item1, item2, item3
    
    static var titles = [item1: "Stocks", item2: "ETFs", item3: "Crypto"]
    
    static var images = [item1: "Stocks", item2: "ETFs", item3: "Crypto"]
    
    static var colors = [item1: UIColor.purple, item2: UIColor.red, item3: UIColor.orange]
    
    var title: String {
        return CategoryItem.titles[self] ?? ""
    }
    
    var image: String {
        return CategoryItem.images[self] ?? ""
    }
    
    var color: UIColor {
        return CategoryItem.colors[self] ?? UIColor.red
    }
    
}

class CategoryView: UIView {
    
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
        tvTableView.separatorStyle = .none
        tvTableView.tableFooterView = UIView()
        
        tvTableView.register(UINib(nibName: CategoryTableViewCell.kIdentifier, bundle: nil), forCellReuseIdentifier: CategoryTableViewCell.kIdentifier)
    }
}

extension CategoryView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoryItem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.kIdentifier) as? CategoryTableViewCell else {
                return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(withItem: CategoryItem.allCases[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
