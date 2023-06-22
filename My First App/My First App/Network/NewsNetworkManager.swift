//
//  NetworkManager.swift
//  H4XOP News
//
//  Created by Waleed Arshad on 21/06/2023.
//

import Foundation

class NewsNetworkManager : ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isLoading = false
    
    func fetchData() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
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
