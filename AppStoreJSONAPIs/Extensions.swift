//
//  Extensions.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 15/07/2021.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

extension UIImageView {
    convenience init(conerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = conerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true 
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
