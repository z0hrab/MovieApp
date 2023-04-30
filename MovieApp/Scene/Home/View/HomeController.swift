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
        self.homeViewModel.getPopularMovies()
        self.homeViewModel.getTopRatedMovies()
        self.homeViewModel.getUpcomingMovies()
        
        self.homeViewModel.successCallback = {
            self.categoryCollection.reloadData() // will reload the categoryCollection view
            print(self.homeViewModel.categoryList.count) // testing
        }
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.homeViewModel.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        // cell.movieList.append(contentsOf: self.homeViewModel.movieList)
        cell.categoryNameTitle.text = self.homeViewModel.categoryList[indexPath.item].categoryName
        cell.movieList.append(contentsOf: self.homeViewModel.categoryList[indexPath.item].movieList)
        cell.movieCollection.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.categoryCollection.frame.width, height: 318)
    }
    
}

