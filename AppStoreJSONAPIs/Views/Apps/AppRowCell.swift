//
//  AppRowCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 15/07/2021.
//

import UIKit



class AppRowCell: UICollectionViewCell {
    let imageView = UIImageView(conerRadius: 16)
    
    
    let titleLabel = UILabel(text: "App Name", font: UIFont.boldSystemFont(ofSize: 20))
    let companyName = UILabel(text: "Compnay Name", font: UIFont.systemFont(ofSize: 16))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.backgroundColor = .systemPurple
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.layer.cornerRadius = 32 / 3
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.translatesAutoresizingMaskIntoConstraints = false
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        getButton.layer.cornerRadius = 16
        
        let stackView = UIStackView(arrangedSubviews: [ imageView,VerticalStackView(addArrangedSubeViews: [titleLabel, companyName]), getButton])
        addSubview(stackView)
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
