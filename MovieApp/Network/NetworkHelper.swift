//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by zed on 14.04.23.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func putURL(path: String) -> String {
        return (self.baseURL + path)
    }
}
