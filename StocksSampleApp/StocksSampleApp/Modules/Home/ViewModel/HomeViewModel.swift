//
//  HomeViewModel.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation

enum HomeContainerViewType: Int, CaseIterable {
    case category, themes, trending
    
    static var titles = [category: "Category", themes: "Themes", trending: "Trending"]
    
    var title: String {
        return HomeContainerViewType.titles[self] ?? ""
    }
}
 
class HomeViewModel {
    
    var selectedContainerType = HomeContainerViewType.category
    
    init() {
        
    }
    
}
