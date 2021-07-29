//
//  Apps.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 14/07/2021.
//

import UIKit

class AppsPageController: BaseListController {
    
    let cellId = "id"
    let headerId = "headerId"
    
    let activityIndictor: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndictor)
        activityIndictor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndictor.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndictor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndictor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndictor.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        fetchData()
    }
    
//    var gamesWeLove: AppGroup?
    var groups = [AppGroup]()
    var dispatchGroup = DispatchGroup()
    
    var group1: AppGroup?
    var group2: AppGroup?
    var group3: AppGroup?
    
    var socialApps = [SocialApp]()
    
    func fetchData() {
        
        self.dispatchGroup.enter()
        Service.shared.fetchGroups(urlString: "https://rss.itunes.apple.com/api/v1/eg/ios-apps/top-free/all/50/explicit.json") { appGroup, error in
            self.dispatchGroup.leave()
            guard let group = appGroup else { return }
            self.group1 = group
        }
        
        self.dispatchGroup.enter()
        Service.shared.fetchNewApp { appGroup, error in
            self.dispatchGroup.leave()
            guard let group = appGroup else { return}
            self.group2 = group
           
        }
        
        self.dispatchGroup.enter()
        Service.shared.fetchNewGame { appGroup, error in
            self.dispatchGroup.leave()
            guard let group = appGroup else {return}
            self.group3 = group
        }
        self.dispatchGroup.enter() 
        Service.shared.fetchSoicalApp { socialApp, error in
            self.dispatchGroup.leave()
            //error if condication
            guard let app = socialApp else { return }
            self.socialApps = app
            print("Social Apps", self.socialApps)
        }
    
        dispatchGroup.notify(queue: .main){
            self.activityIndictor.stopAnimating()
            if let group = self.group1 {
                self.groups.append(group)
            }
            if let group = self.group2 {
                self.groups.append(group)
            }
            if let group = self.group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
        
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appsHeaderHorizontal.socialApps = socialApps
        header.appsHeaderHorizontal.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let group = groups[indexPath.item]
        cell.titelLabel.text = group.feed.title
        cell.horizontalController.appGroup = group
        cell.horizontalController.collectionView.reloadData()
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width
              , height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
