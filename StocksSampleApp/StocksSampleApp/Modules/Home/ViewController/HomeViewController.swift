//
//  HomeViewController.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 20/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOUtlets
    @IBOutlet var vContainerView: UIView!
    @IBOutlet var scSegmentedControl: UISegmentedControl!
    
    // MARK: - Properties
    var viewModel: HomeViewModel!
    
    // MARK: - Controller life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        configureView()
    }

    // MARK: - Private methods
    private func setupNavBar() {
        navigationItem.title = "Explore"
    }
    
    private func configureView() {
        reloadUI()
    }
    
    private func reloadUI() {
        
        DispatchQueue.main.async {
            self.vContainerView.subviews.map{ $0.removeFromSuperview() }
            
            switch self.viewModel.selectedContainerType {
                
            case .category:
                let categoryView = CategoryView(frame: self.vContainerView.frame)
                categoryView.translatesAutoresizingMaskIntoConstraints = false
                self.vContainerView.addSubview(categoryView)
                Constraint.pinAllEdgesOfSubview(subview: categoryView, superView: self.vContainerView)
                
            case .themes:
                let themeView = ThemeView(frame: self.vContainerView.frame)
                themeView.translatesAutoresizingMaskIntoConstraints = false
                self.vContainerView.addSubview(themeView)
                Constraint.pinAllEdgesOfSubview(subview: themeView, superView: self.vContainerView)
                
            case .trending:
                //
                let trendingView = TrendingView(frame: self.vContainerView.frame)
                trendingView.translatesAutoresizingMaskIntoConstraints = false
                self.vContainerView.addSubview(trendingView)
                Constraint.pinAllEdgesOfSubview(subview: trendingView, superView: self.vContainerView)
            }
        }
    }
    
    // MARK: - IBACtions
    @IBAction func valueDidChanged() {
        viewModel.selectedContainerType = HomeContainerViewType(rawValue: scSegmentedControl!.selectedSegmentIndex)!
        reloadUI()
    }
}
