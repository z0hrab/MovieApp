//
//  HomeController.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import UIKit

class HomeController: UIViewController {
    
    var homeViewModel = HomeViewModel()
    
    @IBOutlet var categoryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configHomeController() // Configures the HomeController
    }
    
    func configHomeController() {
        self.homeViewModel.getMovies()
        
        self.homeViewModel.successCallback = {
            self.categoryCollection.reloadData() // will reload the categoryCollection view
//            print("---")
//            print(self.homeViewModel.movieList.first?.title)
//            print("---")
        }
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.movieList.append(contentsOf: self.homeViewModel.movieList)
        cell.movieCollection.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.categoryCollection.frame.width, height: 318)
    }
    
}

