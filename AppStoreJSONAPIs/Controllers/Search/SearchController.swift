//
//  SearchViewController.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 07/07/2021.
//

import UIKit
import SDWebImage

class SearchController: BaseListController, UISearchBarDelegate {
    
    fileprivate let cellIdentifier = "cell123"
    
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    let enterSearchTermLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Please enter search term above..."
        lable.font = UIFont.boldSystemFont(ofSize: 18  )
        lable.textAlignment = .center
        return  lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(CellResultCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterSearchTermLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            enterSearchTermLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterSearchTermLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            enterSearchTermLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
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
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)as! CellResultCell
        cell.appResult = appResults[indexPath.row]
        return cell
    }
    

}
