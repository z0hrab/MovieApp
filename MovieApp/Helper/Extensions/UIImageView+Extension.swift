//
//  UIImageView+Extension.swift
//  MovieApp
//
//  Created by zed on 18.04.23.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(imagePath: String) {
        self.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(imagePath)"))
    }
    
}
