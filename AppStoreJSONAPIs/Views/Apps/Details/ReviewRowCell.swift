//
//  ReviewRowCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 01/08/2021.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewController()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
 
        
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
