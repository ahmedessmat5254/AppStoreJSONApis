//
//  BaseListController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 14/07/2021.
//

import UIKit

class BaseListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
