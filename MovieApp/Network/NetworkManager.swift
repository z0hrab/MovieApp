//
//  NetworkManager.swift
//  MovieApp
//
//  Created by zed on 11.04.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let baseURL = "http://google.com/"
    
    static func request(endPoint: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 header: HTTPHeaders? = nil,
                 completion: @escaping((Data?, String?)->(Void))
    ) {
        
        AF.request("\(endPoint)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: header
        ).responseData { response in
            
            switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            
        } // AF.request() ends here
        
    }
    
}
