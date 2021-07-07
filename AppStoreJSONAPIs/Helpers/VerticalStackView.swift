//
//  VerticalStackView.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(addArrangedSubeViews : [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        addArrangedSubeViews.forEach {addArrangedSubview($0)}
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
