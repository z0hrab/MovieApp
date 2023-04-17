//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by zed on 14.04.23.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    let baseURL = "https://api.themoviedb.org/3/"
    let apiKey = "0292e58c56165593c537853c8e27e646"
    
    func putURL(path: String) -> String {
        return (self.baseURL + path + "?api_key=" + self.apiKey)
    }
}
