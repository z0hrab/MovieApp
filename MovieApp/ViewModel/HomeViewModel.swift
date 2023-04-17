//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation


class HomeViewModel {
    
    var postList: [Post] = [Post]()

    
    var successCallback: (() -> Void)?
    
    func getPosts() {
        NetworkManager.shared.request(model: [Post].self, fullURL: NetworkHelper.shared.putURL(path: "posts") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                // print(data.first?.title) // testing
                self.postList = data
                self.successCallback?()
            }
        }
        
    }
    
    
}
