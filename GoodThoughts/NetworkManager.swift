//
//  NetworkManager.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/4/21.
//

import Foundation

class NetworkManager {
    func fetchQuotes(completionHandler: @escaping ([Quote]) -> Void) {
        print("Network Manager initialized")
        let endpoint = "https://type.fit/api/quotes"
        
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print("datatask going")
            if let error = error {
                print("Error with fetching quotes: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with response: \(String(describing: response))")
                return
            }
            
            if let data = data {
                print(data)
                do {
                    let decoded = try JSONDecoder().decode([Quote].self, from: data)
                    completionHandler(decoded)
                } catch {
                    print(error)
                }
                
               
            }
            print("Data task should be finished")
            
        }.resume()
    }
}
