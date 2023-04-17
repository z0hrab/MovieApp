//
//  Post.swift
//  MovieApp
//
//  Created by zed on 14.04.23.
//

import Foundation


struct Post: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
