//
//  NetworkManager.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()

    func request<T: Codable>(model: T.Type,
                             fullURL: String,
                             method: HTTPMethod = .get,
                             parameters: Parameters? = nil,
                             encoding: ParameterEncoding = URLEncoding.default,
                             header: HTTPHeaders? = nil,
                             completion: @escaping((T?, String?)->(Void))
    ) {
        
        AF.request(fullURL,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: header
        ).responseDecodable(of: T.self) { response in
            
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
            
        } // AF.request() ends here
        
    }
    
}
