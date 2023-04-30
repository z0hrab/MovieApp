//
//  PeopleController.swift
//  MovieApp
//
//  Created by zed on 30.04.23.
//

import UIKit

class PeopleController: UIViewController {
    
    @IBOutlet var peopleCollection: UICollectionView!
    let peopleViewModel = PeopleViewModel()
    let cellID = "\(TopImageBottomLabelCell.self)"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Running configuration methods
        self.configUI()
        self.configVM()
    }
    
    
    func configUI() {
        let nibCell = UINib(nibName: self.cellID, bundle: nil)
        self.peopleCollection.register(nibCell, forCellWithReuseIdentifier: self.cellID)
    }
    
    func configVM() {
        self.peopleViewModel.getPopularPeople()
        self.peopleViewModel.successCallback = {
            self.peopleCollection.reloadData()
        }
    }

}

extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.peopleViewModel.peopleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! TopImageBottomLabelCell
        cell.config(data: self.peopleViewModel.peopleList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.peopleCollection.frame.width/2 - 10, height: 220)
    }
    
    
}
