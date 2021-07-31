//
//  Service.swift
//  AppStoreJSONAPIs
//
//  Created by Ahmed Essmat on 09/07/2021.
//

import Foundation

class Service  {
    static let shared = Service()
    
    func fetchAppp(text: String ,completion: @escaping (SearchResult?, Error?)-> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(text)&entity=software"
        
        fetchGenericJSONData(urlStriing: urlString, complection: completion)
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
        fetchGenericJSONData(urlStriing: urlString, complection: completion)
    }
    
    func fetchSoicalApp(complection: @escaping ([SocialApp]?, Error?) ->()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlStriing: urlString, complection: complection)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlStriing: String, complection: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlStriing) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complection(nil, error)
                return
            }
            guard let data = data else { return }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                complection(object, nil)
            }catch {
                print("Failed to decode data")
                complection(nil, error)
            }
        }
        dataTask.resume()
    }
    
}
