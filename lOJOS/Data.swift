//
//  Data.swift
//  lOJOS
//
//  Created by RAAD BADR on 03/05/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var body: String
    
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
