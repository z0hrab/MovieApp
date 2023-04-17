//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation


class HomeViewModel {
    
    var movieList: [Movie] = [Movie]()
    var successCallback: (() -> Void)?
    
    func getPosts() {
        NetworkManager.shared.request(model: Movie.self, fullURL: NetworkHelper.shared.putURL(path: "movie/popular") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                // self.movieList = data // sets the received data in the array
                self.movieList.append(data)
                self.successCallback?()
            }
        }
        
    }
    
    
}
