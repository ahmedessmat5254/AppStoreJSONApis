//
//  Service.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 09/07/2021.
//

import Foundation


class Service  {
    static let shared = Service()
    
    func fetchAppp(text: String ,completion: @escaping ([Result], Error?)-> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(text)&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        //Fetch data from internet
       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Faild to fetch apps:", error)
                completion([], nil)
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonError {
                print("Faild to decode json:", jsonError)
                completion([], jsonError)
            }
        }
        task.resume()
    }
    
    
    func fetchNewApp(completion: @escaping (AppGroup?, Error?)->()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/eg/ios-apps/new-apps-we-love/all/50/explicit.json"
        fetchGroups(urlString: urlString, completion: completion)
    }
    
    func fetchNewGame(complection: @escaping (AppGroup?, Error?) ->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/eg/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchGroups(urlString: urlString, completion: complection)
    }
    
    
    func fetchGroups(urlString:String, completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: urlString) else {
            print("Invaild URL Please Try Again")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("faild to fetch data:", error)
                completion(nil,error)
            }
            
            guard let data = data else { return }
            do {
               let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                appGroup.feed.results.forEach { print($0.name) }
                completion(appGroup, nil)
            }catch {
                print("Failed to decode data.Please try again")
                completion(nil, error)
            }
            
        }
        dataTask.resume()
    }
}
