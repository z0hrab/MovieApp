//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation

class HomeViewModel {
    
    var movieList: [Result] = [Result]()
    var successCallback: (() -> Void)?
    
    func getMovies() {
        NetworkManager.shared.request(model: Movie.self, fullURL: NetworkHelper.shared.putURL(path: "movie/popular") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                self.movieList.append(contentsOf: data.results) // sets the received data into the array
                self.successCallback?()
            }
        }
        
    }
    
    
}
