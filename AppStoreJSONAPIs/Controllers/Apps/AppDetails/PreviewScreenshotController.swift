//
//  PreviewScreenshotController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 31/07/2021.
//

import UIKit
class PreviewScreenshotController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: -100, right: 0)
    }
    
    class ScreenShotCell: UICollectionViewCell {
        
        let imageView = UIImageView(conerRadius: 16)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
  
            addSubview(imageView)
            imageView.fillSuperview()
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.systemGray4.cgColor
            imageView.backgroundColor = .purple
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotCell
        let screenshotUrl = app?.screenshotUrls[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: screenshotUrl ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 250, height: view.frame.height)
    }
}
