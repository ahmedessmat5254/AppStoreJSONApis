//
//  ReviewController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 01/08/2021.
//

import UIKit

class ReviewController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let reviewId = "reviewId"
    
    var review: Reviews? {
        didSet {
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: reviewId)
        collectionView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: -100, right: 0)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return review?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewId, for: indexPath) as! ReviewCell
        let entry = review?.feed.entry[indexPath.row]
        cell.authorLabel.text = entry?.author.name.label
        cell.bodyLabel.text = entry?.content.label
        cell.titleLabel.text = entry?.title.label
        
        for (index, view) in
            cell.starStackView.arrangedSubviews.enumerated() {
            if let ratingInt = Int(entry!.rating.label) {
                view.alpha = index >= ratingInt ? 0 : 1
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        .init(width: view.frame.width - 45 , height: 250)
    }
    
}
