//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation

class HomeViewModel {
    
    var categoryList: [Category] = [Category]()
    var successCallback: (() -> Void)?
    
    func getPopularMovies() {
        NetworkManager.shared.request(model: Movie.self, fullURL: NetworkHelper.shared.putURL(path: "movie/popular") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                // self.movieList.append(contentsOf: data.results) // sets the received data into the array
                self.categoryList.append(Category(categoryName: "Popular", movieList: data.results))
                self.successCallback?()
            }
        }
    }
    
    
    func getTopRatedMovies() {
        NetworkManager.shared.request(model: Movie.self, fullURL: NetworkHelper.shared.putURL(path: "movie/top_rated") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                // self.movieList.append(contentsOf: data.results) // sets the received data into the array
                self.categoryList.append(Category(categoryName: "Top Rated", movieList: data.results))
                self.successCallback?()
            }
        }
    }
    
    
    func getUpcomingMovies() {
        NetworkManager.shared.request(model: Movie.self, fullURL: NetworkHelper.shared.putURL(path: "movie/upcoming") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                // self.movieList.append(contentsOf: data.results) // sets the received data into the array
                self.categoryList.append(Category(categoryName: "Upcoming", movieList: data.results))
                self.successCallback?()
            }
        }
    }
    
    
}
