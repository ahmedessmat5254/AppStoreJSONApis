//
//  SearchViewController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit
import SDWebImage

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let cellIdentifier = "cell123"
    
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(CellResultCell.self, forCellWithReuseIdentifier: cellIdentifier)
        setupSearchBar()
//        fetchItunesApps()
    }
    
    var appResults = [Result]()
    

    
    func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer  = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Service.shared.fetchAppp(text: searchText) { result, error in
                self.appResults = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                  }
                }
            print(searchText)
        })
  
    }
    
    func fetchItunesApps() {
        Service.shared.fetchAppp(text: "Twitter") { results, error in
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
//        enterSearcTermLabel.isHidden = appResults.count != 0
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
