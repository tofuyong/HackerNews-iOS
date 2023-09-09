//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Andrea Yong on 9/9/23.
//

import Foundation

// By conforming to ObservableObject protocol, the class can start to broadcast one or more of its properties to interested parties
class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() async {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    // optionally bind data to safeData, so that safeData (a non-optional) can be used
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // The use of DispatchQueue.main ensures task runs on the main thread for UI to be updated accurately
                            DispatchQueue.main.async {
                                self.posts = results.hits // self is needed as we are inside a closure
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() // starts the networking task
        }
    }
}
