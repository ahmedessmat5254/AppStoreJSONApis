//
//  CellResultCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit

class CellResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet { 
            nameLable.text = appResult.trackName
            categoryLable.text = appResult.primaryGenreName
            ranksLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl60 ?? "")
            imageView.sd_setImage(with: url)
            
            imageViewScreenshot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                imageViewscreenshot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2 {
                iamgeViewscreenshot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.systemBlue
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
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
        imageView.backgroundColor = .white
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 8
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        return imageView
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            imageViewScreenshot1,
            imageViewscreenshot2,
            iamgeViewscreenshot3,
        ])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let infoStackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(addArrangedSubeViews: [nameLable, categoryLable, ranksLabel]),
            getButton
        ])
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        let overallStackView = VerticalStackView(addArrangedSubeViews: [
            infoStackView,
            screenshotStackView
        ], spacing: 12)
        addSubview(overallStackView)
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
   
