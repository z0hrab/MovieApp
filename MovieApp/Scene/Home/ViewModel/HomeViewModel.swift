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
    
    func getItems(category: HomeCategory) {
        HomeNetworkManager.shared.getMovies(category: category) { data, errorMessage in
                        if let errorMessage = errorMessage {
                            print(errorMessage)
                        } else if let data = data {
                            self.categoryList.append(Category(categoryName: category.rawValue, movieList: data.results))
                            self.successCallback?()
                        }
        }
    }

}
