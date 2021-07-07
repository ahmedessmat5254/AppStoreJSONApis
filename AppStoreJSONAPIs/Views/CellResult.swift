//
//  CellResult.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit

class CellResult: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.systemBlue
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLable: UILabel = {
        let lable = UILabel()
        lable.text = "APP Name"
        return lable
    }()
    
    let categoryLable: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let ranksLabel: UILabel = {
        let label = UILabel()
        label.text = "9.3M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var imageViewScreenshot1 = self.createImageScreenShot()
    lazy var imageViewscreenshot2 = self.createImageScreenShot()
    lazy var iamgeViewscreenshot3 = self.createImageScreenShot()
    
    func createImageScreenShot() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        
        let screenShotStackView = UIStackView(arrangedSubviews: [
            imageViewScreenshot1,
            imageViewscreenshot2,
            iamgeViewscreenshot3
        ])
        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(addArrangedSubeViews: [nameLable,categoryLable,ranksLabel]),
            getButton
        ])
        
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let overallStackView = VerticalStackView(addArrangedSubeViews: [infoTopStackView, screenShotStackView], spacing: 16)
        addSubview(overallStackView)
    
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: self.topAnchor),
            overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
   
