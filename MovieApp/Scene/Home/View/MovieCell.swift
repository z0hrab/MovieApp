//
//  MovieCell.swift
//  MovieApp
//
//  Created by zed on 18.04.23.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    
    func configureMovieCell(movie: Result) {
        self.movieTitle.text = movie.title
        self.movieImage.loadImage(imagePath: movie.posterPath)
        self.movieImage.layer.cornerRadius = 18
    }
    
}
