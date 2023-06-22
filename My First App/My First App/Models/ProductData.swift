//
//  ProductData.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import Foundation

struct Products: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable, Hashable {
    var id: Int
    let title: String
    let description: String
    let thumbnail: String
    let stock: Double
    let discountPercentage: Double
    let rating: Double
    let price: Double
    let images: [String]
    
}
