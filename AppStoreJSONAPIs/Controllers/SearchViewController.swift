//
//  SearchViewController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit
import SDWebImage

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "cell123"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(CellResultCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        fetchItunesApps()
    }
    
    var appResults = [Result]()
    
    func fetchItunesApps() {
        Service.shared.fetchAppp { results, error in
            if let error = error {
                print("Faild to fetch apps:", error)
            }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width:view.frame.width , height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)as! CellResultCell
        cell.appResult = appResults[indexPath.row]
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
