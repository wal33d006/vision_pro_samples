//
//  ProductsNetworkManager.swift
//  New Vision App
//
//  Created by Waleed Arshad on 22/06/2023.
//

import Foundation

class ProductsNetworkManager : ObservableObject {
    
    @Published var products = [Product]()
    @Published var isLoading = false
    @Published var selectedProduct: Product?
    
    func fetchData() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        if let url = URL(string: "https://dummyjson.com/products") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Products.self, from: safeData)
                            DispatchQueue.main.async {
                                self.products = results.products
                                self.selectedProduct = self.products.first
                                self.isLoading = false
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
