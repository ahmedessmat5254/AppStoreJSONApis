//
//  AppsHorztionalHeaderController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 16/07/2021.
//

import UIKit

class AppsHorziontalHeaderController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout{
    let cellId = "id"
    
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: -100, right: 0)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        let app = socialApps[indexPath.item]
        cell.companyName.text = app.name
        cell.titleLabel.text = app.tagline
        cell.imageView.sd_setImage(with: URL(string: app.imageUrl ))
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - 48, height: view.frame.height)
    }

}
