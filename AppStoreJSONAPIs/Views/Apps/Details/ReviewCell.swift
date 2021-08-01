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
    let bodyLabel = UILabel(text: "body lable body label body label body label \n body label \n body ", font: UIFont.systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9449843764, green: 0.9414291978, blue: 0.9734718204, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        let stackView = VerticalStackView(addArrangedSubeViews: [
            UIStackView(arrangedSubviews: [titleLabel, authorLabel], customSpacing: 8),
            starLabel,
            bodyLabel,
            
        ], spacing: 12)
        addSubview(stackView)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
