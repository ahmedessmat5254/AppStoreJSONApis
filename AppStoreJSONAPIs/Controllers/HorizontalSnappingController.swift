//
//  HorizontalSnappingController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 27/07/2021.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    init() {
        
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

