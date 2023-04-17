//
//  HomeController.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import UIKit
import Alamofire

class HomeController: UIViewController {
    
    var movieList: [Movie] = [Movie]()
    var homeViewModel = HomeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configHomeController() // Configures the HomeController
    }
    
    
    func configHomeController() {
        self.homeViewModel.getPosts()
        
        self.homeViewModel.successCallback = {
            // will reload the collection view
            self.movieList.append(contentsOf: self.homeViewModel.movieList)
            print("---")
            print(self.movieList.first?.results.first?.originalTitle ?? "")
            print("---")
        }
    }
    
}

extension HomeController {
    
}

