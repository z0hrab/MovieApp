//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by zed on 30.04.23.
//

import Foundation


class PeopleViewModel {
    
    var successCallback: (() -> Void)?
    var peopleList: [PeopleResult] = [PeopleResult]()
    
    func getPopularPeople() {
        NetworkManager.shared.request(model: People.self, fullURL: NetworkHelper.shared.putURL(path: "person/popular") ) { data, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else if let data = data {
                self.peopleList.append(contentsOf: data.results) // sets the received data into the array
                self.successCallback?()
            }
        }
    }
    
    
}
