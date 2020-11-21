//
//  ThemeView.swift
//  StocksSampleApp
//
//  Created by Xamarin PC on 21/11/20.
//  Copyright © 2020 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

class ThemeView: UIView {
    
    var cvCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        cvCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        cvCollectionView.backgroundColor = .white
        cvCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cvCollectionView)
        Constraint.pinAllEdgesOfSubview(subview: cvCollectionView, superView: self)
        
        cvCollectionView.delegate = self
        cvCollectionView.dataSource = self
        cvCollectionView.register(UINib(nibName: ThemeCollectionViewCell.kIdentifier, bundle: nil), forCellWithReuseIdentifier: ThemeCollectionViewCell.kIdentifier)
    }
}

extension ThemeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.kIdentifier, for: indexPath) as? ThemeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 36
        let height = 80
        return CGSize(width: (collectionView.bounds.width - 36) / 2, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    
}
