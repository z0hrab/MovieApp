//
//  HomeManager.swift
//  MovieApp
//
//  Created by zed on 02.05.23.
//

import Foundation

class HomeNetworkManager {
    
    static let shared = HomeNetworkManager()
    
    func getMovies(category: HomeCategory, complete: @escaping((Movie?, String?)->(Void))) {
        
        var url = ""
        
        switch category {
            case .popular:
                url = HomeEndPoint.popular.path
            case .topRated:
                url = HomeEndPoint.topRated.path
            case .upcomming:
                url = HomeEndPoint.upcomming.path
        }
        
        NetworkManager.shared.request(model: Movie.self, fullURL: url, completion: complete)
    }
    
}
