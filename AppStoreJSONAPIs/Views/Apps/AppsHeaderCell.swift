//
//  AppsHeaderCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 16/07/2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyName = UILabel(text: "Facebook", font: UIFont.systemFont(ofSize: 14))
    let titleLabel = UILabel(text: "Keep up with friends is faster the ever", font: UIFont.systemFont(ofSize: 24))
    let imageView = UIImageView(conerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .red
        
        titleLabel.numberOfLines = 2
        companyName.textColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [VerticalStackView(addArrangedSubeViews: [companyName, titleLabel, imageView], spacing: 8)])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
