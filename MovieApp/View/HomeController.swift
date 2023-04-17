//
//  HomeController.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import UIKit
import Alamofire

class HomeController: UIViewController {
    
    var postList: [Post] = [Post]()
    var homeViewModel = HomeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configHomeController() // Configures the HomeController
    }
    
    
    func configHomeController() {
        self.homeViewModel.getPosts()
        
        self.homeViewModel.successCallback = {
            // will reload the collection view
            self.postList.append(contentsOf: self.homeViewModel.postList)
            print("---")
            print(self.postList[0].title!)
        }
    }
   
    
}
