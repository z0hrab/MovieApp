//
//  CategoryCell.swift
//  MovieApp
//
//  Created by zed on 17.04.23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet var movieCollection: UICollectionView!
    @IBOutlet var categoryNameTitle: UILabel!
    
    var movieList: [Result] = [Result]()
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configureMovieCell(movie: self.movieList[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 167, height: self.movieCollection.frame.height)
    }
    
}
