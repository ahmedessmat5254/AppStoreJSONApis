//
//  AppsPageHeader.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 16/07/2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appsHeaderHorizontal = AppsHorziontalHeaderController()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
       
        appsHeaderHorizontal.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(appsHeaderHorizontal.view)
        
        NSLayoutConstraint.activate([
            appsHeaderHorizontal.view.topAnchor.constraint(equalTo: topAnchor),
            appsHeaderHorizontal.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appsHeaderHorizontal.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appsHeaderHorizontal.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
