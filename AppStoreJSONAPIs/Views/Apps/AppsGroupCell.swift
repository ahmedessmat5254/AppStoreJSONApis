//
//  AppsGroupCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 14/07/2021.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {

    let titelLabel = UILabel(text: "App Sectoin ", font: UIFont.boldSystemFont(ofSize: 30))
    let horizontalController = AppsHorizontalController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titelLabel)
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titelLabel.topAnchor.constraint(equalTo: topAnchor),
            titelLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titelLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    
        horizontalController.view.backgroundColor = .blue
        addSubview(horizontalController.view)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalController.view.topAnchor.constraint(equalTo: titelLabel.bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
