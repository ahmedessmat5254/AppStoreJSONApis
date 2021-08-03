//
//  ReviewCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 01/08/2021.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    
    let titleLabel = UILabel(text: "Title Name", font: UIFont.boldSystemFont(ofSize: 18))
    let authorLabel = UILabel(text: "Author Name", font: UIFont.systemFont(ofSize: 16))
    let starLabel = UILabel(text: "star", font: UIFont.systemFont(ofSize: 16))
    let bodyLabel = UILabel(text: "body lable body label body label body label \n body label \n body ", font: UIFont.systemFont(ofSize: 18), numberOfLines: 0)
    
    let starStackView: UIStackView = {
        var arrangedSubView = [UIView]()
        (0...5).forEach { _ in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainHeight(constant: 24)
            imageView.constrainWidth(constant: 24)
            arrangedSubView.append(imageView)
        }
        arrangedSubView.append(UIView())
        return UIStackView(arrangedSubviews: arrangedSubView)
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9449843764, green: 0.9414291978, blue: 0.9734718204, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        let stackView = VerticalStackView(addArrangedSubeViews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            starStackView,
            bodyLabel,
            
        ], spacing: 12)
        addSubview(stackView)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
