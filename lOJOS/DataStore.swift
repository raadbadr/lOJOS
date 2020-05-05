//
//  DataStore.swift
//  lOJOS
//
//  Created by RAAD BADR on 05/05/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    init() {
        getPosts()
    }
    
    
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
    
}
