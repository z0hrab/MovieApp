//
//  HomeNetworkHelper.swift
//  MovieApp
//
//  Created by zed on 02.05.23.
//

import Foundation


enum HomeCategory: String {
    case popular = "Popular-lar"
    case topRated = "Top Rated-lar"
    case upcomming = "Upcomming-ler"
}

enum HomeEndPoint: String {
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcomming = "movie/upcoming"
    
    var path: String {
        NetworkHelper.shared.putURL(path: self.rawValue)
    }
    
}

