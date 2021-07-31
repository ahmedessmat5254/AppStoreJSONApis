//
//  AppRowCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 15/07/2021.
//

import UIKit



class AppRowCell: UICollectionViewCell {
    
    let imageVieww = UIImageView(conerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageVieww.backgroundColor = .purple
        imageVieww.constrainWidth(constant: 64)
        imageVieww.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32 / 2
        
        let stackView = UIStackView(arrangedSubviews: [imageVieww, VerticalStackView(addArrangedSubeViews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
