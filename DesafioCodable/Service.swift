//
//  Service.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 15/06/22.
//

import Foundation

class Service {
    private let session = URLSession.shared
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let task = session.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let users = try decoder.decode([User].self, from: data)
                completion(users)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
