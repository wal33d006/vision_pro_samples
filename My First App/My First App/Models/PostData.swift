//
//  PostData.swift
//  H4XOP News
//
//  Created by Waleed Arshad on 21/06/2023.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    let num_comments: Int
    let author: String
    
}
