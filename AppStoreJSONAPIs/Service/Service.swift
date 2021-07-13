//
//  Service.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 09/07/2021.
//

import Foundation


class Service  {
    static let shared = Service()
    
    func fetchAppp(completion: @escaping ([Result], Error?)-> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
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
}
