//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by zed on 30.04.23.
//

import UIKit


protocol TopImageBottomLabelCellProtocol {
    var cellImage: String { get }
    var cellTitle: String { get }
}


class TopImageBottomLabelCell: UICollectionViewCell {
    
    @IBOutlet private var topImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        self.topImage.layer.cornerRadius = 20
    }
    
    func config(data: TopImageBottomLabelCellProtocol) {
        self.titleLabel.text = data.cellTitle
        self.topImage.loadImage(imagePath: data.cellImage)
    }

}
