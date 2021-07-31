//
//  AppDetailCell.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 29/07/2021.
//

import UIKit

class AppDetailsCell: UICollectionViewCell {
    
    let logoImageView = UIImageView(conerRadius: 12)
    let nameLabel = UILabel(text: "APP NAME", font: UIFont.boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "4.99$")
    let whatsNewLabel = UILabel(text: "what's new", font: UIFont.boldSystemFont(ofSize: 20), numberOfLines: 0)
    let relaseNotesLabel = UILabel(text: "relase notes", font: UIFont.systemFont(ofSize: 12))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        logoImageView.backgroundColor = .red
        logoImageView.constrainWidth(constant: 140)
        logoImageView.constrainHeight(constant: 140)
        
        
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 0.937254902, alpha: 1)
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        
        let stackView = VerticalStackView(addArrangedSubeViews: [
            UIStackView(arrangedSubviews: [
                logoImageView,
                VerticalStackView(addArrangedSubeViews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [priceButton, UIView()]),
                    UIView()
                    ], spacing: 12)
                ], customSpacing: 20),
            whatsNewLabel,
            relaseNotesLabel
            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
